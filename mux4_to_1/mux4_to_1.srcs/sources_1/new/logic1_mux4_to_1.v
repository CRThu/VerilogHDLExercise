`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/21 21:46:23
// Design Name: 
// Module Name: logic1_mux4_to_1
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

// ����������������ѡһ��·ѡ����ģ��, �������߼�����
// �������ż�������ģ�ͽ��бȽ�
module logic1_mux4_to_1(output out, input i0,i1,i2,i3, input s1,s0);

// �������out���߼�����
assign out = (~s1 & ~s0 & i0)|
             (~s1 &  s0 & i1)|
             ( s1 & ~s0 & i2)|
             ( s1 &  s0 & i3);
             
endmodule
