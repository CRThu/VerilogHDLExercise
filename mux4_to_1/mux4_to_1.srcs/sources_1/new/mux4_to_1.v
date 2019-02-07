`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/20 00:11:36
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

// 四选一多路选择器模块, 端口列表直接取自输入/输出图
module mux4_to_1(output out, input i0,i1,i2,i3, input s1,s0);

// 内部线网声明
wire s1n,s0n;
wire y0,y1,y2,y3;

// 门级实例引用

// 生成s1n,s0n信号
not (s1n, s1);
not (s0n, s0);

// 调用(实例引用)三输入与门
and (y0, i0, s1n, s0n);
and (y1, i1, s1n, s0);
and (y2, i2, s1, s0n);
and (y3, i3, s1, s0);

//调用(实例引用)四输入或门
or (out, y0, y1, y2, y3);

endmodule
