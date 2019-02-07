`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/21 13:55:11
// Design Name: 
// Module Name: fulladd
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

//定义一位全加器
module fulladd(output sum,c_out, input a,b,c_in);

// 内部线网
wire s1, c1, c2;

// 调用(实例引用)逻辑门级原语
xor (s1, a, b);
and (c1, a, b);

xor(sum, s1, c_in);
and(c2, s1, c_in);

xor(c_out, c2, c1);

endmodule
