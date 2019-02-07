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

// ��ģ������Nλ�ļӷ���
module gencase_adder(co, sum, a0, a1, ci);
// ��������, �������������¶���
parameter N = 4;    // Ĭ�ϵ�����λ��Ϊ4

// �˿�����
output [N-1:0] sum;
output co;
input [N-1:0] a0,a1;
input ci;

// �������ߵ�λ��, ����(ʵ������)��Ӧ�ļӷ���
// ����N�ڵ���(ʵ������)ʱ�������¶���
// ����(ʵ������)����ͨλ��ļӷ����Ǹ��ݲ�ͬ��N��������
generate
    case(N)
        // ��N=1��N=1ʱ��ֱ�ѡ��λ��Ϊ1��2�ļӷ���
        1: adder_1bit adder1(co, sum, a0, a1, ci);  // 1λ�ӷ���
        2: adder_2bit adder2(co, sum, a0, a1, ci);  // 2λ�ӷ���
        // Ĭ�������ѡ��λ��ΪNλ�ĳ�ǰ��λ�ӷ���
        default: adder_cla #(N) adder3(co, sum, a0, a1, ci);
    endcase
endgenerate // ���ɿ�Ľ���

endmodule
