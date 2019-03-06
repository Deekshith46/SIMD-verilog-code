`timescale 1ns/1ps

module decoder( instruction, rs1_rd_en , rs2_rd_en, rd_wr_en, add_en, bitrev_en, mul_en, sub_en, rs1, rs2,rd); // initial module
input [31:0] instruction; // 32 bit instruction
output reg add_en; // add
output reg bitrev_en; // bitreverse
output reg mul_en; //  multiple
//output reg sra_en; //shift opertion
//output reg srl_en; // shift operation
output reg sub_en; // subraction
//output reg swap_en; // swap

output reg rs1_rd_en; // rs1 read enable
output reg rs2_rd_en; // rs1 read enable
output reg rd_wr_en; // rd write enable

output reg [4:0] rs1; //  rs1 address
output reg [4:0] rs2; // rs1 address
output reg [4:0] rd; // rd address

wire [6:0] opcode; // wires
wire [6:0] func7; // wires
wire [2:0] func3; // wires

assign opcode = instruction[6:0];  // length of the opcode
assign func7 = instruction [31:25]; // length of the func7
assign func3 = instruction [14:12]; // length of the func3


always@(*)
begin
//default
    add_en = 1'b0;
    bitrev_en = 1'b0;
    mul_en = 1'b0;
    sub_en = 1'b0;
    rs1 = 5'b0;
    rs2 = 5'b0;
    rd = 5'b0;
    rs1_rd_en = 1'b0;
    rs2_rd_en = 1'b0;
    rd_wr_en = 1'b0;
// add
	if(func7==7'b0100000 && func3== 3'b000 && opcode == 7'b1110111) 
		begin
			add_en = 1'b1;
			bitrev_en = 1'b0;
			mul_en = 1'b0;
			sub_en = 1'b0;
			//swap_en = 1'b0;
			rs1 = instruction [19:15];
			rs2 = instruction [24:20];
			rd = instruction [11:7];
			rs1_rd_en = 1'b1;
			rs2_rd_en = 1'b1;
			rd_wr_en = 1'b1;
		end
//bitrev
	else if(func7==7'b1110011 && func3== 3'b000  && opcode == 7'b1110111)
		begin
			add_en = 1'b0;
			bitrev_en = 1'b1;
			mul_en = 1'b0;
			sub_en = 1'b0;
		 	rs1 = instruction [19:15];
			rs2 = instruction [24:20];
			rd = instruction [11:7];
			rs1_rd_en = 1'b1;
			rs2_rd_en = 1'b1;
			rd_wr_en = 1'b1;
		end
//mul
	else if(func7==7'b1010000 && func3== 3'b000  && opcode == 7'b1110111)
		begin
			add_en = 1'b0;
			bitrev_en = 1'b0;
			mul_en = 1'b1;
			sub_en = 1'b0;
			rs1 = instruction [19:15];
			rs2 = instruction [24:20];
			rd = instruction [11:7];
			rs1_rd_en = 1'b1;
			rs2_rd_en = 1'b1;
			rd_wr_en = 1'b1;
	end
//sub
	else if(func7==7'b0100001 && func3== 3'b000  && opcode == 7'b1110111)
		begin
			add_en = 1'b0;
			bitrev_en = 1'b0;
			mul_en = 1'b0;
			sub_en = 1'b1;
			rs1 = instruction [19:15];
			rs2 = instruction [24:20];
			rd = instruction [11:7];
			rs1_rd_en = 1'b1;
			rs2_rd_en = 1'b1;
			rd_wr_en = 1'b1;
		end
	end
endmodule







