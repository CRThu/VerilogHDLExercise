`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/01 17:10:10
// Design Name: 
// Module Name: func_shifter
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

// 定义一个包含移位函数的模块
module func_shifter;

// 左/右移位寄存器
`define LEFT_SHIFT   1'b0
`define RIGHT_SHIFT  1'b1
reg [31:0] addr, left_addr,right_addr;

// 每当新地址出现时就计算右移位值和左移位值
always @(addr)
begin
    // 调用下面定义的具有左右移位功能的函数
    left_addr = shift(addr, `LEFT_SHIFT);
    right_addr = shift(addr, `RIGHT_SHIFT);
end

// 定义移位函数,其输出是一个32位的值
function [31:0] shift;
input [31:0] address;
input reg control;
begin
    // 根据控制信号适当的设置输出值
    shift = (control==`LEFT_SHIFT) ? (address<<1) : (address>>1);
end
endfunction

initial
begin
    addr = 31'b0000_0000_0000_1111_1111_0000_0000_0000;
    #5 $finish;
end

endmodule
