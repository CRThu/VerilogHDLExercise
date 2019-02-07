`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/23 14:37:32
// Design Name: 
// Module Name: nonblocking_assign
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


module nonblocking_assign;

reg x,y,z;
reg [15:0] reg_a,reg_b;
integer count;

// ������Ϊ���������initial��always���ڲ�
initial
begin
    x = 0; y = 1; z = 1;  // ������ֵ
    count = 0;    // ���α�����ֵ
    reg_a = 16'b0;  reg_b = reg_a;  // �����ĳ�ʼ��
    
    reg_a[2] <= #15 1'b1; // ���ӳٵ�λѡ��ֵ
    reg_b[15:13] <= #10 {x, y, z};  // ��ƴ�Ӳ����Ľ����ֵ�������Ĳ���λ(��)
    
    count <= count + 1; // �����α�����ֵ(����)
    
    #20 $finish;
end
endmodule
