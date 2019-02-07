`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/22 15:40:43
// Design Name: 
// Module Name: T_FF
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

// 边沿触发的T触发器, 每个时钟周期翻转一次
module T_FF(output q, input clk, clear);

// 调用(实例引用)边沿触发的D触发器
// 输出q取反后反馈到输入
// 注意D触发器的qbar端口不需要, 让它悬空
edge_dff ff1(q, , ~q, clk, clear);

endmodule
