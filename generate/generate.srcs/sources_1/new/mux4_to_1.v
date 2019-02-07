`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/26 18:28:05
// Design Name: 
// Module Name: mux4_to_1
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

// 四选一多路选择器,其端口列表完全根据输入/输出图编写
module mux4_to_1(out, i0, i1, i2, i3, s1, s0);

// 根据输入/输出图的端口声明
output out;
input i0,i1,i2,i3;
input s1,s0;
// 输出端口被声明为寄存器类型变量
reg out;

// 若输入信号改变, 则重新计算输出信号out
// 造成输出信号out重新计算的所有输入信号必须写入always @(...)的电平敏感列表
always @(s1 or s0 or i0 or i1 or i2 or i3)
begin
    case ({s1, s0})
        2'b00 : out = i0;
        2'b01 : out = i1;
        2'b10 : out = i2;
        2'b11 : out = i3;
        default: out = 1'bx;
    endcase
end

endmodule
