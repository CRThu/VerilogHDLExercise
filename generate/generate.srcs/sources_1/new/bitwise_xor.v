`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/24 23:57:49
// Design Name: 
// Module Name: bitwise_xor
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

// 本模块生成两条N位总线变量的按位异或

module bitwise_xor(out, i0, i1);

parameter N= 32;    // 默认的总线位宽为32位

output [N-1:0] out;
input [N-1:0] i0,i1;

// 声明一个临时循环变量, 该变量只用于生成块的循环计算, Verilog仿真时该变量在设计中并不存在
genvar j;

// 用一个单循环生成按位异或的异或门(xor)
generate
    for (j=0; j<N; j=j+1)
    begin: xor_loop  // xor_loop位循环生成语句的名字
        xor g1(out[j], i0[j], i1[j]);
    end // 在生成块内部结束循环
endgenerate // 结束生成块

// 异或门可以用always块来替代
// reg [N-1:0] out;
/*
generate
    for(j=0; j<N; j=j+1)
    begin: bit
        always @(i0[j] or i1[j])
            out[j] = i0[j] ^ i1[j];
    end
endgenerate
*/
endmodule
