`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/26 18:14:52
// Design Name: 
// Module Name: case_adder
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

// 本模块生成N位的加法器
module gencase_adder(co, sum, a0, a1, ci);
// 参数声明, 本参数可以重新定义
parameter N = 4;    // 默认的总线位宽为4

// 端口声明
output [N-1:0] sum;
output co;
input [N-1:0] a0,a1;
input ci;

// 根据总线的位宽, 调用(实例引用)相应的加法器
// 参数N在调用(实例引用)时可以重新定义
// 调用(实例引用)不互通位宽的加法器是根据不同的N来决定的
generate
    case(N)
        // 当N=1或N=1时会分别选用位宽为1或2的加法器
        1: adder_1bit adder1(co, sum, a0, a1, ci);  // 1位加法器
        2: adder_2bit adder2(co, sum, a0, a1, ci);  // 2位加法器
        // 默认情况下选用位宽为N位的超前进位加法器
        default: adder_cla #(N) adder3(co, sum, a0, a1, ci);
    endcase
endgenerate // 生成块的结束

endmodule
