`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/19 20:35:28
// Design Name: 
// Module Name: testbench
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


module testbench;

wire [0:15] out;
reg in1,in2;

gates g1(out,in1,in2);

initial
begin
    in1=0;in2=0;
    #5 in1=0;in2=1;
    #5 in1=1;in2=0;
    #5 in1=1;in2=1;
    #5 $finish;
end

endmodule
