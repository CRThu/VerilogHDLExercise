`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/21 21:58:56
// Design Name: 
// Module Name: logic1_fulladd4
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

// ����������䶨����λȫ����
module logic1_fulladd4(output [3:0] sum, output c_out, input [3:0] a,b, input c_in);

// ָ��ȫ�����Ĺ���
assign { c_out, sum } = a + b + c_in;

endmodule
