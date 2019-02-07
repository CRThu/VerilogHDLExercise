`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/23 14:11:03
// Design Name: 
// Module Name: blocking_assign
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


module blocking_assign;

reg x,y,z;
reg [15:0] reg_a,reg_b;
integer count;

// ������Ϊ���������initial��always���ڲ�
initial
begin
    x = 0; y = 1; z = 1;  // ������ֵ
    count = 0;    // ���α�����ֵ
    reg_a = 16'b0;  reg_b = reg_a;  // �����ĳ�ʼ��
    
    #15 reg_a[2] = 1'b1;    // ���ӳٵ�λѡ��ֵ
    #10 reg_b[15:13] = {x, y, z};   // ��ƴ�Ӳ����Ľ����ֵ�������Ĳ���λ(��)
    
    count = count + 1;  // �����ͱ�����ֵ(����)
    
    #20 $finish;
end
endmodule
