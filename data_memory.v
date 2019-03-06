`timescale 1ns/1ps

module data_memory(a,wd,clk,rst,we,rd);
input[15:0] a,wd;
input clk, we,rst;
output reg [15:0] rd;

reg [31:0] data_mem[31:0];

always@(posedge clk)begin
 if(rst)
 begin
 rd<=data_mem[a];
 end
 else
 begin
 rd<= 15'h0000;
 end
end

always@(posedge clk)begin
 if(we)
 begin
 data_mem[a]=wd;
 end
end 
endmodule


