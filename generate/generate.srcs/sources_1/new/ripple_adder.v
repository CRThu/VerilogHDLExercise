`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/25 15:41:58
// Design Name: 
// Module Name: ripple_adder
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

// ��ģ������һ���ż������ӷ���
module ripple_adder(co,sum,a0,a1,ci);
// �����������,�����������¶���
parameter N = 4;    // Ĭ�ϵ�����λ��Ϊ4

// �˿��������
output [N-1:0] sum;
output co;
input [N-1:0] a0,a1;
input ci;

// ���������������
wire [N-1:0] carry;

// ָ����λ�����ĵ�0λ���ڽ�λ������
assign carry[0] = ci;

// ������ʱѭ������, �ñ���ֻ�������ɿ�ļ���
// ���ڷ���ǰѭ�������Ѿ�չƽ,������verilog����ƽ��з���ʱ.�ñ����Ѿ�������
genvar i;

// ��һ����ѭ�����ɰ�λ����ŵ��߼�
generate for(i=0; i<N; i=i+1)
begin: r_loop
    wire t1,t2,t3;
    xor g1(t1, a0[i],a1[i]);
    xor g2(sum[i], t1, carry[i]);
    and g3(t2, a0[i], a1[i]);
    and g4(t3, t1, carry[i]);
    or g5(carry[i+1], t2, t3);
end // ���ɿ��ڲ�ѭ���Ľ���
endgenerate // ���ɿ�Ľ��� 

// ���������ѭ������,verilog���������Զ�����������Բ��ʵ����
// xor : r_loop[0].g1, r_loop[1].g1, r_loop[2].g1, r_loop[3].g1
//       r_loop[0].g2, r_loop[1].g2, r_loop[2].g2, r_loop[3].g2
// and : r_loop[0].g3, r_loop[1].g3, r_loop[2].g3, r_loop[3].g3
//       r_loop[0].g4, r_loop[1].g4, r_loop[2].g4, r_loop[3].g4
// or  : r_loop[0].g5, r_loop[1].g5, r_loop[2].g5, r_loop[3].g5

// �������ɵ�ʵ����������Щ���ɵ�������������
// Nets : r_loop[0].t1, r_loop[0].t2, r_loop[0].t3
//        r_loop[1].t1, r_loop[1].t2, r_loop[1].t3
//        r_loop[2].t1, r_loop[2].t2, r_loop[2].t3
//        r_loop[3].t1, r_loop[3].t2, r_loop[3].t3

assign co = carry[N-1];

endmodule
