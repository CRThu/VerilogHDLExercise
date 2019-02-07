`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/04 15:22:20
// Design Name: 
// Module Name: ifdef_ifndef_testbench
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


module ifdef_ifndef_testbench;

ifdef_ifndef b1();  // 无条件调用模块

`ifdef ADD_B2
    ifdef_ifndef b2();  // 若定义ADD_B2文本宏标志,则有条件的调用b2
`elsif ADD_B3
    ifdef_ifndef b3();  // 若定义ADD_B3文本宏标志,则有条件的调用b3
`else
    ifdef_ifndef b4();  // 在默认情况下,,则有条件的调用b4
`endif

`ifndef IGNORE_B5
    ifdef_ifndef b5();  // 若没有定义IGNORE_B5文本宏标志,则有条件的调用b5
`endif

endmodule
