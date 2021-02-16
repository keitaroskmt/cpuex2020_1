module data_mem_wrap(
    input wire clk,
    input wire rstn,
    input wire MemWriteM3,
    input wire [31:0] alu_resultM3,
    input wire [31:0] srcbM3,
    output wire [31:0] read_dataW3,
    input wire MemWriteM4,
    input wire [31:0] alu_resultM4,
    input wire [31:0] srcbM4,
    output wire [31:0] read_dataW4
    );
    reg [3:0] counter_core;
    reg [3:0] counter_mem;
    reg en;
    reg we;
    reg [15:0] flag3;
    reg [15:0] flag4;
    reg [31:0] waddr;
    reg [31:0] wdata;
    reg [31:0] cache3_0,cache3_1,cache3_2,cache3_3,cache3_4,cache3_5,cache3_6,cache3_7,cache3_8,cache3_9,cache3_10,cache3_11,cache3_12,cache3_13,cache3_14,cache3_15;
    reg [31:0] cache4_0,cache4_1,cache4_2,cache4_3,cache4_4,cache4_5,cache4_6,cache4_7,cache4_8,cache4_9,cache4_10,cache4_11,cache4_12,cache4_13,cache4_14,cache4_15;
    wire [31:0] rdata3;
    wire [31:0] rdata4;
    (* ram_style = "distributed" *)reg [31:0] DATA [0:15];
    (* ram_style = "distributed" *)reg [31:0] ADDR [0:15];
    integer i;
    initial for (i=0; i<16; i=i+1) DATA[i] = 0;
    initial for (i=0; i<16; i=i+1) ADDR[i] = 0;
    data_mem_bl_twoport dmblv3(clk,en,en,we,waddr,alu_resultM3,wdata,rdata3);
    data_mem_bl_twoport dmblv4(clk,en,en,we,waddr,alu_resultM4,wdata,rdata4);
    assign read_dataW3 = flag3[0] ? cache3_0
                        :(flag3[1] ? cache3_1
                        :(flag3[2] ? cache3_2
                        :(flag3[3] ? cache3_3
                        :(flag3[4] ? cache3_4
                        :(flag3[5] ? cache3_5
                        :(flag3[6] ? cache3_6
                        :(flag3[7] ? cache3_7
                        :(flag3[8] ? cache3_8
                        :(flag3[9] ? cache3_9
                        :(flag3[10] ? cache3_10
                        :(flag3[11] ? cache3_11
                        :(flag3[12] ? cache3_12
                        :(flag3[13] ? cache3_13
                        :(flag3[14] ? cache3_14
                        :(flag3[15] ? cache3_15
                        : rdata3)))))))))))))));
    assign read_dataW4 = flag4[0] ? cache4_0
                        :(flag4[1] ? cache4_1
                        :(flag4[2] ? cache4_2
                        :(flag4[3] ? cache4_3
                        :(flag4[4] ? cache4_4
                        :(flag4[5] ? cache4_5
                        :(flag4[6] ? cache4_6
                        :(flag4[7] ? cache4_7
                        :(flag4[8] ? cache4_8
                        :(flag4[9] ? cache4_9
                        :(flag4[10] ? cache4_10
                        :(flag4[11] ? cache4_11
                        :(flag4[12] ? cache4_12
                        :(flag4[13] ? cache4_13
                        :(flag4[14] ? cache4_14
                        :(flag4[15] ? cache4_15
                        : rdata4)))))))))))))));
    always @(posedge clk) begin
        if (~rstn) begin
            counter_core <= 0;
            counter_mem <= 0;
            en <= 1;
            {flag3,flag4} <= 0;
            {cache3_0,cache3_1,cache3_2,cache3_3,cache3_4,cache3_5,cache3_6,cache3_7} <= 0;
            {cache3_8,cache3_9,cache3_10,cache3_11,cache3_12,cache3_13,cache3_14,cache3_15} <= 0;
            {cache4_0,cache4_1,cache4_2,cache4_3,cache4_4,cache4_5,cache4_6,cache4_7} <= 0;
            {cache4_8,cache4_9,cache4_10,cache4_11,cache4_12,cache4_13,cache4_14,cache4_15} <= 0;
            {waddr,wdata} <= 0;
            we <= 0;
        end else begin
            if(MemWriteM3 && MemWriteM4)begin //store at buffer
                counter_core <= counter_core + 2;
                DATA[counter_core] <= srcbM3;
                DATA[counter_core+4'b0001] <= srcbM4;
                ADDR[counter_core] <= alu_resultM3;
                ADDR[counter_core+4'b0001] <= alu_resultM4;
            end else if(MemWriteM3)begin
                counter_core <= counter_core + 1;
                DATA[counter_core] <= srcbM3;
                ADDR[counter_core] <= alu_resultM3;
            end else if(MemWriteM4)begin
                counter_core <= counter_core + 1;
                DATA[counter_core] <= srcbM4;
                ADDR[counter_core] <= alu_resultM4;
            end
            if(counter_core != counter_mem)begin //write to data mem
                we <= 1'b1;
                waddr <= ADDR[counter_mem];
                wdata <= DATA[counter_mem];
                counter_mem <= counter_mem + 1;
            end else begin
                we <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b1111] == alu_resultM3) && (counter_core != counter_mem))begin // using complement on two to express subtraction (since verilog does not consider 111(-1) and 111(7) as same value)
                cache3_0 <= DATA[counter_core + 4'b1111];
                flag3[0] <= 1'b1;
            end else begin
                flag3[0] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b1110] == alu_resultM3) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin // using complement on two to express subtraction (since verilog does not consider 111(-1) and 111(7) as same value)
                cache3_1 <= DATA[counter_core + 4'b1110];
                flag3[1] <= 1'b1;
            end else begin
                flag3[1] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b1101] == alu_resultM3) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) &&(counter_core != counter_mem))begin
                cache3_2 <= DATA[counter_core + 4'b1101];
                flag3[2] <= 1'b1;
            end else begin
                flag3[2] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b1100] == alu_resultM3) && (counter_core + 4'b1101 != counter_mem) &&(counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache3_3 <= DATA[counter_core + 4'b1100];
                flag3[3] <= 1'b1;
            end else begin
                flag3[3] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b1011] == alu_resultM3) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) &&(counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache3_4 <= DATA[counter_core + 4'b1011];
                flag3[4] <= 1'b1;
            end else begin
                flag3[4] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b1010] == alu_resultM3) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache3_5 <= DATA[counter_core + 4'b1010];
                flag3[5] <= 1'b1;
            end else begin
                flag3[5] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b1001] == alu_resultM3) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache3_6 <= DATA[counter_core + 4'b1001];
                flag3[6] <= 1'b1;
            end else begin
                flag3[6] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b1000] == alu_resultM3) && (counter_core + 4'b1001 != counter_mem) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache3_7 <= DATA[counter_core + 4'b1000];
                flag3[7] <= 1'b1;
            end else begin
                flag3[7] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b0111] == alu_resultM3) && (counter_core + 4'b1000 != counter_mem) && (counter_core + 4'b1001 != counter_mem) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache3_8 <= DATA[counter_core + 4'b0111];
                flag3[8] <= 1'b1;
            end else begin
                flag3[8] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b0110] == alu_resultM3) && (counter_core + 4'b0111 != counter_mem) && (counter_core + 4'b1000 != counter_mem) && (counter_core + 4'b1001 != counter_mem) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache3_9 <= DATA[counter_core + 4'b0110];
                flag3[9] <= 1'b1;
            end else begin
                flag3[9] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b0101] == alu_resultM3) && (counter_core + 4'b0110 != counter_mem) && (counter_core + 4'b0111 != counter_mem) && (counter_core + 4'b1000 != counter_mem) && (counter_core + 4'b1001 != counter_mem) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache3_10 <= DATA[counter_core + 4'b0101];
                flag3[10] <= 1'b1;
            end else begin
                flag3[10] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b0100] == alu_resultM3) && (counter_core + 4'b0101 != counter_mem) && (counter_core + 4'b0110 != counter_mem) && (counter_core + 4'b0111 != counter_mem) && (counter_core + 4'b1000 != counter_mem) && (counter_core + 4'b1001 != counter_mem) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache3_11 <= DATA[counter_core + 4'b0100];
                flag3[11] <= 1'b1;
            end else begin
                flag3[11] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b0011] == alu_resultM3) && (counter_core + 4'b0100 != counter_mem) && (counter_core + 4'b0101 != counter_mem) && (counter_core + 4'b0110 != counter_mem) && (counter_core + 4'b0111 != counter_mem) && (counter_core + 4'b1000 != counter_mem) && (counter_core + 4'b1001 != counter_mem) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache3_12 <= DATA[counter_core + 4'b0011];
                flag3[12] <= 1'b1;
            end else begin
                flag3[12] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b0010] == alu_resultM3) && (counter_core + 4'b0011 != counter_mem) && (counter_core + 4'b0100 != counter_mem) && (counter_core + 4'b0101 != counter_mem) && (counter_core + 4'b0110 != counter_mem) && (counter_core + 4'b0111 != counter_mem) && (counter_core + 4'b1000 != counter_mem) && (counter_core + 4'b1001 != counter_mem) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache3_13 <= DATA[counter_core + 4'b0010];
                flag3[13] <= 1'b1;
            end else begin
                flag3[13] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b0001] == alu_resultM3) && (counter_core + 4'b0010 != counter_mem) && (counter_core + 4'b0011 != counter_mem) && (counter_core + 4'b0100 != counter_mem) && (counter_core + 4'b0101 != counter_mem) && (counter_core + 4'b0110 != counter_mem) && (counter_core + 4'b0111 != counter_mem) && (counter_core + 4'b1000 != counter_mem) && (counter_core + 4'b1001 != counter_mem) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache3_14 <= DATA[counter_core + 4'b0001];
                flag3[14] <= 1'b1;
            end else begin
                flag3[14] <= 1'b0;
            end
            if ((waddr == alu_resultM3) && we ) begin
                cache3_15 <= wdata;
                flag3[15] <= 1'b1;
            end else begin
                flag3[15] <= 1'b0;
            end

            if ((ADDR[counter_core + 4'b1111] == alu_resultM4) && (counter_core != counter_mem))begin // using complement on two to express subtraction (since verilog does not consider 111(-1) and 111(7) as same value)
                cache4_0 <= DATA[counter_core + 4'b1111];
                flag4[0] <= 1'b1;
            end else begin
                flag4[0] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b1110] == alu_resultM4) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin // using complement on two to express subtraction (since verilog does not consider 111(-1) and 111(7) as same value)
                cache4_1 <= DATA[counter_core + 4'b1110];
                flag4[1] <= 1'b1;
            end else begin
                flag4[1] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b1101] == alu_resultM4) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) &&(counter_core != counter_mem))begin
                cache4_2 <= DATA[counter_core + 4'b1101];
                flag4[2] <= 1'b1;
            end else begin
                flag4[2] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b1100] == alu_resultM4) && (counter_core + 4'b1101 != counter_mem) &&(counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache4_3 <= DATA[counter_core + 4'b1100];
                flag4[3] <= 1'b1;
            end else begin
                flag4[3] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b1011] == alu_resultM4) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) &&(counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache4_4 <= DATA[counter_core + 4'b1011];
                flag4[4] <= 1'b1;
            end else begin
                flag4[4] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b1010] == alu_resultM4) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache4_5 <= DATA[counter_core + 4'b1010];
                flag4[5] <= 1'b1;
            end else begin
                flag4[5] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b1001] == alu_resultM4) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache4_6 <= DATA[counter_core + 4'b1001];
                flag4[6] <= 1'b1;
            end else begin
                flag4[6] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b1000] == alu_resultM4) && (counter_core + 4'b1001 != counter_mem) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache4_7 <= DATA[counter_core + 4'b1000];
                flag4[7] <= 1'b1;
            end else begin
                flag4[7] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b0111] == alu_resultM4) && (counter_core + 4'b1000 != counter_mem) && (counter_core + 4'b1001 != counter_mem) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache4_8 <= DATA[counter_core + 4'b0111];
                flag4[8] <= 1'b1;
            end else begin
                flag4[8] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b0110] == alu_resultM4) && (counter_core + 4'b0111 != counter_mem) && (counter_core + 4'b1000 != counter_mem) && (counter_core + 4'b1001 != counter_mem) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache4_9 <= DATA[counter_core + 4'b0110];
                flag4[9] <= 1'b1;
            end else begin
                flag4[9] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b0101] == alu_resultM4) && (counter_core + 4'b0110 != counter_mem) && (counter_core + 4'b0111 != counter_mem) && (counter_core + 4'b1000 != counter_mem) && (counter_core + 4'b1001 != counter_mem) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache4_10 <= DATA[counter_core + 4'b0101];
                flag4[10] <= 1'b1;
            end else begin
                flag4[10] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b0100] == alu_resultM4) && (counter_core + 4'b0101 != counter_mem) && (counter_core + 4'b0110 != counter_mem) && (counter_core + 4'b0111 != counter_mem) && (counter_core + 4'b1000 != counter_mem) && (counter_core + 4'b1001 != counter_mem) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache4_11 <= DATA[counter_core + 4'b0100];
                flag4[11] <= 1'b1;
            end else begin
                flag4[11] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b0011] == alu_resultM4) && (counter_core + 4'b0100 != counter_mem) && (counter_core + 4'b0101 != counter_mem) && (counter_core + 4'b0110 != counter_mem) && (counter_core + 4'b0111 != counter_mem) && (counter_core + 4'b1000 != counter_mem) && (counter_core + 4'b1001 != counter_mem) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache4_12 <= DATA[counter_core + 4'b0011];
                flag4[12] <= 1'b1;
            end else begin
                flag4[12] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b0010] == alu_resultM4) && (counter_core + 4'b0011 != counter_mem) && (counter_core + 4'b0100 != counter_mem) && (counter_core + 4'b0101 != counter_mem) && (counter_core + 4'b0110 != counter_mem) && (counter_core + 4'b0111 != counter_mem) && (counter_core + 4'b1000 != counter_mem) && (counter_core + 4'b1001 != counter_mem) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache4_13 <= DATA[counter_core + 4'b0010];
                flag4[13] <= 1'b1;
            end else begin
                flag4[13] <= 1'b0;
            end
            if ((ADDR[counter_core + 4'b0001] == alu_resultM4) && (counter_core + 4'b0010 != counter_mem) && (counter_core + 4'b0011 != counter_mem) && (counter_core + 4'b0100 != counter_mem) && (counter_core + 4'b0101 != counter_mem) && (counter_core + 4'b0110 != counter_mem) && (counter_core + 4'b0111 != counter_mem) && (counter_core + 4'b1000 != counter_mem) && (counter_core + 4'b1001 != counter_mem) && (counter_core + 4'b1010 != counter_mem) && (counter_core + 4'b1011 != counter_mem) && (counter_core + 4'b1100 != counter_mem) && (counter_core + 4'b1101 != counter_mem) && (counter_core + 4'b1110 != counter_mem) && (counter_core + 4'b1111 != counter_mem) && (counter_core != counter_mem))begin
                cache4_14 <= DATA[counter_core + 4'b0001];
                flag4[14] <= 1'b1;
            end else begin
                flag4[14] <= 1'b0;
            end
            if ((waddr == alu_resultM4) && we ) begin
                cache4_15 <= wdata;
                flag4[15] <= 1'b1;
            end else begin
                flag4[15] <= 1'b0;
            end
        end
    end
endmodule