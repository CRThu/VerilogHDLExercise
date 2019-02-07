`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/22 15:44:13
// Design Name: 
// Module Name: edge_dff
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

// 边沿触发的D触发器
module edge_dff(output q,qbar, input d,clk,clear);

// 内部变量
wire s, sbar, r, rbar, cbar;


// 数据流声明语句
// 生成clear的反相信号
assign cbar = ~clear;

// 输入锁存; 锁存器时电平敏感的,边沿触发的寄存器由三个SR锁存器组成
assign sbar = ~(rbar & s),
       s = ~(sbar & cbar & ~clk),
       r = ~(rbar & ~clk & s),
       rbar = ~(r & cbar & d);

// 输出锁存
assign q = ~(s & qbar),
       qbar = ~(q & r & cbar);
       
endmodule
