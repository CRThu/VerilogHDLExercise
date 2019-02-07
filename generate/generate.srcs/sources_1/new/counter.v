`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/26 18:36:24
// Design Name: 
// Module Name: counter
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

// 四位二进制计数器
module counter(Q, clock, clear);

// 输入/输出端口
output [3:0] Q;
input clock, clear;
// 输出变量Q被定义为寄存器类型
reg[3:0] Q;

always @(posedge clear or negedge clock)
begin
    if(clear)
        Q <= 4'd0;  // 为了能生成诸如触发器一类的时序逻辑, 建议使用非阻塞赋值
    else
        Q <= Q + 1; // Q是一个四位的寄存器, 计数超过15之后又会归零, 因此模16没有必要
end

endmodule
