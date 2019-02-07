`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/26 17:51:52
// Design Name: 
// Module Name: multiplier
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

// ��ģ��ʵ��һ���������˷���
module genif_multiplier(product, a0, a1);
// ��������,�ò����������¶���
parameter a0_width = 8; // 8-bit bus by default
parameter a1_width = 8; // 8-bit bus by default

// ���ز�������
// ���ز��������ò������¶���(defparam)�޸�
// Ҳ������ʵ������ʱͨ�����ݲ������,�� #(����1,����2,...)�ķ����޸�
localparam product_width = a0_width + a1_width;

// �˿��������
output [product_width-1:0] product;
input [a0_width-1:0] a0;
input [a1_width-1:0] a1;

// �������ĵ���(ʵ������)��ͬ���͵ĳ˷���
// ���ݲ���a0_width��a1_width��ֵ.�ڵ���ʱ�������Ӧ�ĳ˷���ʵ��
generate
    if(a0_width < 8 || a1_width < 8)
        cla_multiplier #(a0_width, a1_width) m0 (product, a0, a1);
    else
        tree_multiplier #(a0_width, a1_width) m0 (product, a0, a1);
endgenerate

endmodule
