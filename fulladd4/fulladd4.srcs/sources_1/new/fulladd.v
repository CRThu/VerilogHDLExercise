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

//����һλȫ����
module fulladd(output sum,c_out, input a,b,c_in);

// �ڲ�����
wire s1, c1, c2;

// ����(ʵ������)�߼��ż�ԭ��
xor (s1, a, b);
and (c1, a, b);

xor(sum, s1, c_in);
and(c2, s1, c_in);

xor(c_out, c2, c1);

endmodule
