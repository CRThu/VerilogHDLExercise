`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/03 17:30:11
// Design Name: 
// Module Name: assign_deassign
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

// �����첽��λ��,���½��ش�����D������
module assign_deassign(q, qbar, d, clk, reset);

// ��������
output q,qbar;
input d,clk,reset;
reg q, qbar;    // ��q, qbar����Ϊ�Ĵ���

always @(negedge clk)   //����Ч��ʱ����Ϊq��qbar��ֵ
begin
    q = d;
    qbar = ~d;
end

always @(reset) // ��reset����Ϊ�ߵ�ƽʱ,ʹ�ù���������ֵ���, ��д(����)���渳ֵ����q��qbar�ĸ�ֵ
    if(reset)
    begin   // ���resetΪ�ߵ�ƽ,�ù���������ֵ����е���ֵ, ��д(����)���渳ֵ����q�ĸ�ֵ
       assign q = 1'b0;
       assign qbar = 1'b1;
    end
    else
    begin   // ���reset����Ϊ�͵�ƽ,ͨ��dessign���ȡ����q��qbarֵ�ĸ���
            // ���渳ֵ���q = d��qbar = ~d���ܹ�����һ��ʱ���½���ʱ�̸ı�Ĵ�����ֵ
        deassign q;
        deassign qbar;
    end

endmodule
