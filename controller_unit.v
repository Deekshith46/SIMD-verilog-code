`timescale 1ns/1ps

module control_unit( clk, rst ,enable, rs1_rd_en ,rs2_rd_en, rd_wr_en, add_en, bitrev_en, mul_en,  sub_en, rs1, rs2,rd);

input clk;
input rst;
input enable;

output  add_en; 
output  bitrev_en; 
output  mul_en; 
//output  sra_en; 
//output  srl_en; 
output  sub_en; 
//output  swap_en; 

output  rs1_rd_en; 
output  rs2_rd_en; 
output  rd_wr_en; 

output  [4:0] rs1; 
output  [4:0] rs2; 
output  [4:0] rd; 



wire[31:0] rd_wire;
wire read_valid_wire;

wire[31:0] instruction_wire;

program_cntr program_counter(.clk(clk),
				.rst(rst),
				.enable(enable),
				. instr_read_addr( rd_wire),
				.read_valid(read_valid_wire));

instruction_memory1 instruction_memory (. address( rd_wire),
					//. write_data(), 
					//.clk(clk), 
					//.write_en(),
					. read_en(read_valid_wire),
					. rd(instruction_wire));

decoder decoder_1  ( .instruction(instruction_wire),
		  .rs1_rd_en(rs1_rd_en) , 
		.rs2_rd_en(rs2_rd_en ), 
		.rd_wr_en(rd_wr_en), 
		.add_en(add_en), 
		.bitrev_en(bitrev_en),
		. mul_en(mul_en),
		//. sra_en(sra_en), 
		//.srl_en(srl_en),
		. sub_en( sub_en),
		//. swap_en(swap_en),
		. rs1(rs1),
		. rs2(rs2),
		.rd(rd));

endmodule

