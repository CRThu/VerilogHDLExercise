`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/21 21:58:56
// Design Name: 
// Module Name: logic1_fulladd4
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

// 用数据流语句定义四位全加器
module logic1_fulladd4(output [3:0] sum, output c_out, input [3:0] a,b, input c_in);

// 指定全加器的功能
assign { c_out, sum } = a + b + c_in;

endmodule
