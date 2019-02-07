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

// ���ش�����D������
module edge_dff(output q,qbar, input d,clk,clear);

// �ڲ�����
wire s, sbar, r, rbar, cbar;


// �������������
// ����clear�ķ����ź�
assign cbar = ~clear;

// ��������; ������ʱ��ƽ���е�,���ش����ļĴ���������SR���������
assign sbar = ~(rbar & s),
       s = ~(sbar & cbar & ~clk),
       r = ~(rbar & ~clk & s),
       rbar = ~(r & cbar & d);

// �������
assign q = ~(s & qbar),
       qbar = ~(q & r & cbar);
       
endmodule
