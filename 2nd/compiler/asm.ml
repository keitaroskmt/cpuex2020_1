(* MIPS assembly with a few virtual instructions *)

type id_or_imm = V of Id.t | C of int
type t = (* 命令の列 (caml2html: sparcasm_t) *)
  | Ans of exp
  | Let of (Id.t * Type.t) * exp * t
and exp = (* 一つ一つの命令に対応する式 (caml2html: sparcasm_exp) *)
  | Nop
  | Set of int
  | SetF of Id.l
  | SetL of Id.l
  | Mov of Id.t
  | Neg of Id.t
  | Add of Id.t * id_or_imm
  | Sub of Id.t * id_or_imm
  | Mul of Id.t * id_or_imm
  | Div of Id.t * id_or_imm
  | SLL of Id.t * id_or_imm
  | Ld of Id.t * id_or_imm
  | St of Id.t * Id.t * id_or_imm
  | FMovD of Id.t
  | FNegD of Id.t
  | FAddD of Id.t * Id.t
  | FSubD of Id.t * Id.t
  | FMulD of Id.t * Id.t
  | FDivD of Id.t * Id.t
  | FAbs of Id.t
  | FSqr of Id.t
  | Ftoi of Id.t
  | Itof of Id.t
  | Floor of Id.t
  | LdF of Id.t * id_or_imm
  | StF of Id.t * Id.t * id_or_imm
  | Comment of string
  (* virtual instructions *)
  | IfEq of Id.t * id_or_imm * t * t
  | IfLE of Id.t * id_or_imm * t * t
  | IfGE of Id.t * id_or_imm * t * t (* 左右対称ではないので必要 *)
  | IfFEq of Id.t * Id.t * t * t
  | IfFLE of Id.t * Id.t * t * t
  (* closure address, integer arguments, and float arguments *)
  | CallCls of Id.t * Id.t list * Id.t list
  | CallDir of Id.l * Id.t list * Id.t list
  | Save of Id.t * Id.t (* レジスタ変数の値をスタック変数へ保存 (caml2html: sparcasm_save) *)
  | Restore of Id.t (* スタック変数から値を復元 (caml2html: sparcasm_restore) *)
type fundef = { name : Id.l; args : Id.t list; fargs : Id.t list; body : t; ret : Type.t }
(* プログラム全体 = 浮動小数点数テーブル + トップレベル関数 + メインの式 (caml2html: sparcasm_prog) *)
type prog = Prog of (Id.l * float) list * fundef list * t

let fletd(x, e1, e2) = Let((x, Type.Float), e1, e2)
let seq(e1, e2) = Let((Id.gentmp Type.Unit, Type.Unit), e1, e2)


(* super-tenuki *)
let rec remove_and_uniq xs = function
  | [] -> []
  | x :: ys when S.mem x xs -> remove_and_uniq xs ys
  | x :: ys -> x :: remove_and_uniq (S.add x xs) ys

(* free variables in the order of use (for spilling) (caml2html: sparcasm_fv) *)
let fv_id_or_imm = function V(x) -> [x] | _ -> []
let rec fv_exp = function
  | Nop | Set(_) | SetF(_) | SetL(_) | Comment(_) | Restore(_) -> []
  | Mov(x) | Neg(x) | FMovD(x) | FNegD(x) | FAbs(x) | FSqr(x) | Ftoi(x) | Itof(x) | Floor(x) | Save(x, _) -> [x]
  | Add(x, y') | Sub(x, y') | Mul(x, y') | Div(x, y') | SLL(x, y') | Ld(x, y') | LdF(x, y') -> x :: fv_id_or_imm y'
  | St(x, y, z') | StF(x, y, z') -> x :: y :: fv_id_or_imm z'
  | FAddD(x, y) | FSubD(x, y) | FMulD(x, y) | FDivD(x, y) -> [x; y]
  | IfEq(x, y', e1, e2) | IfLE(x, y', e1, e2) | IfGE(x, y', e1, e2) -> x :: fv_id_or_imm y' @ remove_and_uniq S.empty (fv e1 @ fv e2) (* uniq here just for efficiency *)
  | IfFEq(x, y, e1, e2) | IfFLE(x, y, e1, e2) -> x :: y :: remove_and_uniq S.empty (fv e1 @ fv e2) (* uniq here just for efficiency *)
  | CallCls(x, ys, zs) -> x :: ys @ zs
  | CallDir(_, ys, zs) -> ys @ zs
and fv = function
  | Ans(exp) -> fv_exp exp
  | Let((x, t), exp, e) ->
      fv_exp exp @ remove_and_uniq (S.singleton x) (fv e)
let fv e = remove_and_uniq S.empty (fv e)

let rec concat e1 xt e2 =
  match e1 with
  | Ans(exp) -> Let(xt, exp, e2)
  | Let(yt, exp, e1') -> Let(yt, exp, concat e1' xt e2)

(*
let align i = (if i mod 8 = 0 then i else i + 4)
*)


let regs = (* Array.init 16 (fun i -> Printf.sprintf "%%r%d" i) *)
  [| "%v0"; "%v1"; "%a0"; "%a1";
     "%a2"; "%a3"; "%t0"; "%t1"; "%t2"; "%t3"; "%t4"; "%t5"; "%t6"; "%t7";
     "%s0"; "%s1"; "%s2"; "%s3"; "%s4"; "%s5"; "%s6"; "%s7"; "%t8"; "%t9";
     "%k0"; "%k1"; (* "%fp"; *)|]
let fregs = Array.init 30 (fun i -> Printf.sprintf "%%f%d" i)
(* 
let allregs = Array.to_list regs
let allfregs = Array.to_list fregs
*)
(* int *)
let reg_cl = regs.(Array.length regs - 1) (* closure address (caml2html: sparcasm_regcl) *)
let reg_sw = regs.(Array.length regs - 2) (* temporary for swap *)
let reg_zero = "%zero" (* zero pointer *)
let reg_sp = "%sp" (* stack pointer *)
let reg_hp = "%hp" (* heap pointer (caml2html: sparcasm_reghp) *)
let reg_gp = "%min_caml_gp"
let reg_ra = "%ra" (* return address *)
let reg_at = "%at" (* for assembler *)
(* float *)
let reg_fsw = fregs.(Array.length fregs - 1) (* temporary for swap *)
let reg_fat = "%f30" (* for assembler *)
let reg_fzero = "%fzero"
let is_reg x = (x.[0] = '%')

(*
let hp_init = 60000
let sp_init = 600000
*)
let sp_init = 130000

(* regAllocbyColor.ml用 *)
let registers = 
  ["%v0"; "%v1"; "%a0"; "%a1"; "%a2"; "%a3"; "%t0"; "%t1";
   "%t2"; "%t3"; "%t4"; "%t5"; "%t6"; "%t7"; "%s0"; "%s1";
   "%s2"; "%s3"; "%s4"; "%s5"; "%s6"; "%s7"; "%t8"; "%t9";
   "%k0"; "%k1"; "%fp"; "%hp"; "%sp"; "%ra"; "%at"; "%zero"]
let fregisters = 
  ["%f0"; "%f1"; "%f2"; "%f3"; "%f4"; "%f5"; "%f6"; "%f7";
   "%f8"; "%f9"; "%f10"; "%f11"; "%f12"; "%f13"; "%f14"; "%f15";
   "%f16"; "%f17"; "%f18"; "%f19"; "%f20"; "%f21"; "%f22"; "%f23";
   "%f24"; "%f25"; "%f26"; "%f27"; "%f28"; "%f29"; "%f30"; "%fzero"]

let allregs = registers
let allfregs = fregisters

let reg_map = 
    let nenv = 
        List.fold_left 
            (fun env reg -> M.add reg reg env) M.empty registers in
    List.fold_left
        (fun env reg -> M.add reg reg env) nenv fregisters

let specialregs = [("%k1", Type.Int); ("%fp", Type.Int); ("%hp", Type.Int); ("%sp", Type.Int); ("%ra", Type.Int); ("%at", Type.Int); ("%zero", Type.Int); ("%fzero", Type.Float)] 

let iargregs = 
    let iargregs' = ["%v0"; "%v1"; "%a0"; "%a1"]
        in List.map (fun x -> (x, Type.Int)) iargregs'

let fargregs = 
    let fargregs' = ["%f0"; "%f1"; "%f2"; "%f3"]
        in List.map (fun x -> (x, Type.Float)) fargregs'

let icalleesaves = 
    let icalleesaves' = ["%a2"; "%a3"; "%t0"; "%t1"; "%t2"; "%t3"; "%t4"; "%t5"]
        in List.map (fun x -> (x, Type.Int)) icalleesaves'

let fcalleesaves = 
    let fcalleesaves' = ["%f4"; "%f5"; "%f6"; "%f7"; "%f8"; "%f9"; "%f10"; "%f11"; "%f12"; "%f13"; "%f14"]
        in List.map (fun x -> (x, Type.Float)) fcalleesaves'

let icallersaves = 
    let icallersaves' = ["%t6"; "%t7"; "%s0"; "%s1"; "%s2"; "%s3"; "%s4"; "%s5"; "%s6"; "%s7"; "%t8"; "%t9"; "%k0"]
        in List.map (fun x -> (x, Type.Int)) icallersaves'

let fcallersaves =
    let fcallersaves' = ["%f15"; "%f16"; "%f17"; "%f18"; "%f19"; "%f20"; "%f21"; "%f22"; "%f23"; "%f24"; "%f25"; "%f26"; "%f27"; "%f28"; "%f29"; "%f30"]
        in List.map (fun x -> (x, Type.Float)) fcallersaves'


let argregs = iargregs @ fargregs
let calleesaves = icalleesaves @ fcalleesaves
let callersaves = icallersaves @ fcallersaves

let calldefs =  (reg_ra, Type.Int) :: callersaves @ argregs
        


(* for debug *)
let asm_debug oc l =
    let rec print_tab level =
        if level = 0 then ()
        else (Printf.fprintf oc "\t"; print_tab (level-1))
    
    and print_list l = 
        let rec print_list_sub = function
        | [] -> Printf.fprintf oc "]"
        | x :: rest -> (Printf.fprintf oc "%s, " x; print_list_sub rest) in
        Printf.fprintf oc "[";
        print_list_sub l

    and print_t e level = 
        (
        print_tab level;
        match e with
        | Ans(exp) ->
            Printf.fprintf oc "Ans\n";
            print_exp exp (level + 1)
        | Let((x, t), exp, e) ->
            Printf.fprintf oc "Let %s " x;
            Type.print_type oc t;
            Printf.fprintf oc "\n";
            print_exp exp (level + 1);
            print_tab (level + 1);
            Printf.fprintf oc "in\n";
            print_t e (level + 1)
        )

    and print_exp e level = 
        (
        print_tab level;
        match e with
        | Nop ->
            Printf.fprintf oc "Nop\n"
        | Set(i) ->
            Printf.fprintf oc "Set %d\n" i
        | SetF(Id.L(x)) ->
            Printf.fprintf oc "SetF %s\n" x
        | SetL(Id.L(x)) ->
            Printf.fprintf oc "SetL %s\n" x
        | Mov(x) ->
            Printf.fprintf oc "Mov %s\n" x
        | Neg(x) ->
            Printf.fprintf oc "Neg %s\n" x
        | Add(x, y') ->
            (match y' with
            | V(y) -> Printf.fprintf oc "Add %s %s\n" x y
            | C(i) -> Printf.fprintf oc "Add %s %d\n" x i)
        | Sub(x, y') ->
            (match y' with
            | V(y) -> Printf.fprintf oc "Sub %s %s\n" x y
            | C(i) -> Printf.fprintf oc "Sub %s %d\n" x i)
        | Mul(x, y') ->
            (match y' with
            | V(y) -> Printf.fprintf oc "Mul %s %s\n" x y
            | C(i) -> Printf.fprintf oc "Mul %s %d\n" x i)
        | Div(x, y') ->
            (match y' with
            | V(y) -> Printf.fprintf oc "Div %s %s\n" x y
            | C(i) -> Printf.fprintf oc "Div %s %d\n" x i)
        | SLL(x, y') ->
            (match y' with
            | V(y) -> Printf.fprintf oc "SLL %s %s\n" x y
            | C(i) -> Printf.fprintf oc "SLL %s %d\n" x i)
        | Ld(x, y') ->
            (match y' with
            | V(y) -> Printf.fprintf oc "Ld %s %s\n" x y
            | C(i) -> Printf.fprintf oc "Ld %s %d\n" x i)
        | St(x, y, z') ->
            (match z' with
            | V(z) -> Printf.fprintf oc "St %s %s %s\n" x y z 
            | C(i) -> Printf.fprintf oc "St %s %s %d\n" x y i)
        | FMovD(x) ->
            Printf.fprintf oc "FMovD %s\n" x
        | FNegD(x) ->
            Printf.fprintf oc "FNegD %s\n" x
        | FAddD(x, y) ->
            Printf.fprintf oc "FAddD %s %s\n" x y
        | FSubD(x, y) ->
            Printf.fprintf oc "FSubD %s %s\n" x y
        | FMulD(x, y) ->
            Printf.fprintf oc "FMulD %s %s\n" x y
        | FDivD(x, y) ->
            Printf.fprintf oc "FDivD %s %s\n" x y
        | FAbs(x) ->
            Printf.fprintf oc "FAbs %s\n" x
        | FSqr(x) ->
            Printf.fprintf oc "FSqr %s\n" x
        | Ftoi(x) ->
            Printf.fprintf oc "Ftoi %s\n" x
        | Itof(x) ->
            Printf.fprintf oc "Itof %s\n" x
        | Floor(x) ->
            Printf.fprintf oc "Floor %s\n" x
        | LdF(x, y') ->
            (match y' with
            | V(y) -> Printf.fprintf oc "LdF %s %s\n" x y
            | C(i) -> Printf.fprintf oc "LdF %s %d\n" x i)
        | StF(x, y, z') ->
            (match z' with
            | V(z) -> Printf.fprintf oc "StF %s %s %s\n" x y z 
            | C(i) -> Printf.fprintf oc "StF %s %s %d\n" x y i)
        | Comment(s) ->
            Printf.fprintf oc "Comment: %s\n" s
        | IfEq(x, y', e1, e2) ->
            (match y' with
            | V(y) -> Printf.fprintf oc "IfEq %s %s\n" x y
            | C(i) -> Printf.fprintf oc "IFEq %s %d\n" x i);
            print_t e1 (level+1);
            print_t e2 (level+1)
        | IfLE(x, y', e1, e2) ->
            (match y' with
            | V(y) -> Printf.fprintf oc "IfLE %s %s\n" x y
            | C(i) -> Printf.fprintf oc "IfLE %s %d\n" x i);
            print_t e1 (level+1);
            print_t e2 (level+1)
        | IfGE(x, y', e1, e2) ->
            (match y' with
            | V(y) -> Printf.fprintf oc "IfGE %s %s\n" x y
            | C(i) -> Printf.fprintf oc "IfGE %s %d\n" x i);
            print_t e1 (level+1);
            print_t e2 (level+1)
        | IfFEq(x, y, e1, e2) ->
            Printf.fprintf oc "IfFEq %s %s\n" x y;
            print_t e1 (level+1);
            print_t e2 (level+1)
        | IfFLE(x, y, e1, e2) ->
            Printf.fprintf oc "IfFLE %s %s\n" x y;
            print_t e1 (level+1);
            print_t e2 (level+1)
        | CallCls(x, args, fargs) ->
            Printf.fprintf oc "CallCls %s\n" x;
            print_tab (level+1);
            Printf.fprintf oc "args: ";
            print_list args;
            Printf.fprintf oc "\n";
            print_tab (level+1);
            Printf.fprintf oc "fargs: ";
            print_list fargs;
            Printf.fprintf oc "\n"
        | CallDir(Id.L(x), args, fargs) ->
            Printf.fprintf oc "CallDir %s\n" x;
            print_tab (level+1);
            Printf.fprintf oc "args: ";
            print_list args;
            Printf.fprintf oc "\n";
            print_tab (level+1);
            Printf.fprintf oc "fargs: ";
            print_list fargs;
            Printf.fprintf oc "\n"
        | Save(x, y) ->
            Printf.fprintf oc "Save %s %s\n" x y
        | Restore(x) ->
            Printf.fprintf oc "Restore %s\n" x
        )

    and print_h ({name = Id.L(x); args = ys; fargs = zs; body = e; ret = _}) =
        Printf.fprintf oc "name : %s\n" x;
        Printf.fprintf oc "args: ";
        print_list ys;
        Printf.fprintf oc "\n";
        Printf.fprintf oc "fargs: ";
        print_list zs;
        Printf.fprintf oc "\n";
        print_t e 0

    and print_f (Prog(data, fundefs, e)) =
        List.map print_h fundefs;
        print_t e 0

    in print_f l
