`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/25 00:26:37
// Design Name: 
// Module Name: bitwise_xor_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bitwise_xor_testbench;

wire [31:0] out;
reg [31:0] i0,i1;

bitwise_xor x(out,i0,i1);

initial
begin
    i0 = 32'b1111_1110_1100_1000_0001_0011_0111_1111;
    i1 = 32'b0101_0101_0101_0101_0101_0101_0101_0101;
    //       1010_1011_1001_1101_0100_0110_0010_1010
    #5 $finish;
end


endmodule
