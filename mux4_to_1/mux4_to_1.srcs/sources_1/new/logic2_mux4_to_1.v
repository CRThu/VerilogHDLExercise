`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/21 21:53:11
// Design Name: 
// Module Name: logic2_mux4_to_1
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

// ����������������ѡһ��·ѡ����ģ��, �����������������
// �������ż�������ģ�ͽ��бȽ�
module logic2_mux4_to_1(output out, input i0,i1,i2,i3, input s1,s0);

assign out = s1 ? ( s0 ? i3 : i2 ) : ( s0 ? i1 : i0 ) ;

endmodule
