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

// ��ģ����������Nλ���߱����İ�λ���

module bitwise_xor(out, i0, i1);

parameter N= 32;    // Ĭ�ϵ�����λ��Ϊ32λ

output [N-1:0] out;
input [N-1:0] i0,i1;

// ����һ����ʱѭ������, �ñ���ֻ�������ɿ��ѭ������, Verilog����ʱ�ñ���������в�������
genvar j;

// ��һ����ѭ�����ɰ�λ���������(xor)
generate
    for (j=0; j<N; j=j+1)
    begin: xor_loop  // xor_loopλѭ��������������
        xor g1(out[j], i0[j], i1[j]);
    end // �����ɿ��ڲ�����ѭ��
endgenerate // �������ɿ�

// ����ſ�����always�������
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
