`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/18 20:54:11
// Design Name: 
// Module Name: gates
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

module gates(output[0:15] OUT, input IN1, IN2);

// 基本门的实例引用
and a1(OUT[0], IN1, IN2);
nand na1(OUT[1], IN1, IN2);
or or1(OUT[2], IN1, IN2);
nor nor1(OUT[3], IN1, IN2);
xor x1(OUT[4], IN1, IN2);
xnor nx1(OUT[5], IN1, IN2);

// 输入端超过两个;三个输入端的与非门
nand na1_3inp(OUT[6], IN1, IN2, 1);
// 实例引用门时, 不给实例命名
and (OUT[7], IN1, IN2);

// 基本门的实例引用
buf b1(OUT[8], IN1);
not n1(OUT[9], IN1);

// 输出端多余两个
wire TMP;
buf b1_2out(OUT[10], TMP, IN1);
// 实例引用门时, 不给实例命名
not (OUT[11], TMP);

// 调用(实例引用)bufif/notif
// bufif1 bf1(out, in, ctrl);
bufif1 bf1(OUT[12], IN1, IN2);
bufif0 bf0(OUT[13], IN1, IN2);
notif1 nf1(OUT[14], IN1, IN2);
notif0 nf0(OUT[15], IN1, IN2);

// 基本门数组的调用(实例引用)
// wire [7:0] OUT,IN1,IN2;
// nand n_gate[7:0](OUT,IN1,IN2);

endmodule
