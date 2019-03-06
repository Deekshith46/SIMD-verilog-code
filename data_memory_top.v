`timescale 1ns/1ps

module memory ( select_line, a, wd,clk,rst,we,result);
input [15:0] a;
input [15:0] wd; 
input clk, rst, we,select_line;
output [15:0] result;
 
wire [15:0] rd_wire;

data_memory datamemory ( .a(a),
			.wd(wd),
			.clk(clk),
			.rst(rst),
			.we(we),
			.rd(rd_wire));

mux mux(.aluresult_out(a),
	.rd(rd_wire),
	.result(result),
	. select_line(select_line));
endmodule
