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

// ����һ��������λ������ģ��
module func_shifter;

// ��/����λ�Ĵ���
`define LEFT_SHIFT   1'b0
`define RIGHT_SHIFT  1'b1
reg [31:0] addr, left_addr,right_addr;

// ÿ���µ�ַ����ʱ�ͼ�������λֵ������λֵ
always @(addr)
begin
    // �������涨��ľ���������λ���ܵĺ���
    left_addr = shift(addr, `LEFT_SHIFT);
    right_addr = shift(addr, `RIGHT_SHIFT);
end

// ������λ����,�������һ��32λ��ֵ
function [31:0] shift;
input [31:0] address;
input reg control;
begin
    // ���ݿ����ź��ʵ����������ֵ
    shift = (control==`LEFT_SHIFT) ? (address<<1) : (address>>1);
end
endfunction

initial
begin
    addr = 31'b0000_0000_0000_1111_1111_0000_0000_0000;
    #5 $finish;
end

endmodule
