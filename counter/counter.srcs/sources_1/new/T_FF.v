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

// ���ش�����T������, ÿ��ʱ�����ڷ�תһ��
module T_FF(output q, input clk, clear);

// ����(ʵ������)���ش�����D������
// ���qȡ������������
// ע��D��������qbar�˿ڲ���Ҫ, ��������
edge_dff ff1(q, , ~q, clk, clear);

endmodule
