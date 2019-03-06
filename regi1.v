`timescale 1ns/1ps

module register_file_1(
    input [4:0] rs1,   // address of  rs1
    input [4:0] rs2,   // address of rs2
    input [4:0] rd,    //  address of rd
    input [15:0] wr_data,  // data to write 
    input clk, rd_wr_en, rs1_rd_en, rs2_rd_en,  // clock, rd_write enable , rs1 read enable , rs2 read enable
    output  [15:0] rs1_data, // rs1_data output 1
    output  [15:0] rs2_data  // rs2_data output 2
);

    reg [31:0] register[31:0]; // initial the memory

initial begin
$readmemh("mem.hex", register);
end

    always @(posedge clk) begin   // clock at positive edge
        if (rd_wr_en) begin          // write enable if 1
            register[rd] <= wr_data;  // data to write in register of rd address
        end
    end

 assign  rs1_data = ( rs1_rd_en) ? (rs1==5'd0)? 16'd0: register[rs1]: 16'h0000; // read the data of data present in rs1 address to rs1_data
 assign  rs2_data =  ( rs2_rd_en) ? (rs2==5'd0) ? 16'd0 : register[rs2]:16'h0000;   // read the data of data present in rs2 address to rs2_data
   
endmodule

