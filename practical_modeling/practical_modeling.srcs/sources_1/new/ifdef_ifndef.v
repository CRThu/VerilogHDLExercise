`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/04 15:19:26
// Design Name: 
// Module Name: ifdef_ifndef
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

// 条件编译
`define TEST

`ifdef TEST // 若设置TEST标志,则编译模块
module ifdef_ifndef;
endmodule
`endif