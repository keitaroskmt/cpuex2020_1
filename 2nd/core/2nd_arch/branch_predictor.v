`timescale 1ns / 100ps
`default_nettype none
//gshare
module branch_predictor
    ( input wire clk,
     input wire rstn,
     input wire branch_type,
     input wire [31:0] pc,
     input wire [31:0] branched_pc_plus,
     input wire branch,
     output wire branch_prediction);

(* ram_style = "distributed" *)reg [1:0] RAM [0:1023];

reg [9:0] global_hisory;

wire [9:0] index;

reg [9:0] gh1;
reg [9:0] gh2;
reg [9:0] gh3;
reg [9:0] gh4;
reg [14:0] pc1;
reg [14:0] pc2;
reg [14:0] pc3;
reg [14:0] pc4;
reg bp1;
reg bp2;
reg bp3;
reg bp4;

wire [1:0] counter1;
wire [1:0] counter2;
wire [1:0] counter3;
wire [1:0] counter4;


initial begin
    $readmemb("bp_init.mem",RAM,0,1023);
end

assign index = global_hisory ^ pc[9:0];
assign branch_prediction = (RAM[index] == 2'b10 || RAM[index] == 2'b11) ? 1'b1 : 1'b0;

assign counter1 = RAM[gh1];
assign counter2 = RAM[gh2];
assign counter3 = RAM[gh3];
assign counter4 = RAM[gh4];


always @(posedge clk) begin
    if(~rstn)begin
        {gh1,pc1,bp1} <= 0;
        {gh2,pc2,bp2} <= 0;
        {gh3,pc3,bp3} <= 0;
        {gh4,pc4,bp4} <= 0;
        global_hisory <= 0;
    end else begin
        gh1 <= index;
        pc1 <= pc[14:0];
        bp1 <= branch_prediction;
        gh2 <= gh1;
        pc2 <= pc1;
        bp2 <= bp1;
        gh3 <= gh2;
        pc3 <= pc2;
        bp3 <= bp2;
        gh4 <= gh3;
        pc4 <= pc3;
        bp4 <= bp3;
        if (branch && (pc4 == branched_pc_plus[14:0]-1)) begin
            if(bp4)begin
                RAM[gh4] <= counter4 - 1;
            end else begin
                RAM[gh4] <= counter4 + 1;
            end
        end else if (branch && pc3 == branched_pc_plus[14:0]-1)begin
            if(bp3)begin
                RAM[gh3] <= counter3 - 1;
            end else begin
                RAM[gh3] <= counter3 + 1;
            end
        end else if (branch && pc2 == branched_pc_plus[14:0]-1)begin
            if(bp2)begin
                RAM[gh2] <= counter2 - 1;
            end else begin
                RAM[gh2] <= counter2 + 1;
            end
        end else if (branch && pc1 == branched_pc_plus[14:0]-1)begin
            if(bp1)begin
                RAM[gh1] <= counter1 - 1;
            end else begin
                RAM[gh1] <= counter1 + 1;
            end
        end
        if(branch_type)begin
          global_hisory[9:1] <= {global_hisory[8:0],branch_prediction};
        end
    end
end



endmodule