`timescale 1ns/1ps
module mux ( aluresult_out ,rd, result, select_line);
input [15:0] aluresult_out;
input [15:0] rd;
input select_line;
output reg [15:0] result;

always@(*) begin

case(select_line) 
 1'b1 : result = aluresult_out;
 1'b0 : result = rd;
 default : result = 16'h0000;
endcase

end 
endmodule




