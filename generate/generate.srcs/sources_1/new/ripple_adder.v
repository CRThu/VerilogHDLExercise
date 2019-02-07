`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/25 15:41:58
// Design Name: 
// Module Name: ripple_adder
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

// 本模块生成一个门级脉动加法器
module ripple_adder(co,sum,a0,a1,ci);
// 参数声明语句,参数可以重新定义
parameter N = 4;    // 默认的总线位宽为4

// 端口声明语句
output [N-1:0] sum;
output co;
input [N-1:0] a0,a1;
input ci;

// 本地现网声明语句
wire [N-1:0] carry;

// 指定进位变量的第0位等于进位的输入
assign carry[0] = ci;

// 声明临时循环变量, 该变量只用于生成块的计算
// 由于仿真前循环生成已经展平,所以用verilog对设计进行仿真时.该变量已经不存在
genvar i;

// 用一个单循环生成按位异或门等逻辑
generate for(i=0; i<N; i=i+1)
begin: r_loop
    wire t1,t2,t3;
    xor g1(t1, a0[i],a1[i]);
    xor g2(sum[i], t1, carry[i]);
    and g3(t2, a0[i], a1[i]);
    and g4(t3, t1, carry[i]);
    or g5(carry[i+1], t2, t3);
end // 生成块内部循环的结束
endgenerate // 生成块的结束 

// 根据上面的循环生成,verilog编译器会自动生成以下相对层次实例名
// xor : r_loop[0].g1, r_loop[1].g1, r_loop[2].g1, r_loop[3].g1
//       r_loop[0].g2, r_loop[1].g2, r_loop[2].g2, r_loop[3].g2
// and : r_loop[0].g3, r_loop[1].g3, r_loop[2].g3, r_loop[3].g3
//       r_loop[0].g4, r_loop[1].g4, r_loop[2].g4, r_loop[3].g4
// or  : r_loop[0].g5, r_loop[1].g5, r_loop[2].g5, r_loop[3].g5

// 上面生成的实例用下面这些生成的线网连接起来
// Nets : r_loop[0].t1, r_loop[0].t2, r_loop[0].t3
//        r_loop[1].t1, r_loop[1].t2, r_loop[1].t3
//        r_loop[2].t1, r_loop[2].t2, r_loop[2].t3
//        r_loop[3].t1, r_loop[3].t2, r_loop[3].t3

assign co = carry[N-1];

endmodule
