`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/23 15:52:22
// Design Name: 
// Module Name: latency
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


module latency;
// �������
parameter latency = 20;
parameter delta = 2;
// ����Ĵ�������
reg x,y,z,p,q;

initial
begin
    x = 0;  // û���ӳٿ���
    #10 y = 1;  // �ӳ�ֵʱ���ֵ��ӳٿ���,#10��ִ��y=1
    
    #latency z = 0; // ʹ�ñ�ʶ�����ӳٿ���,�ӳ�#20
    #(latency + delta) p = 1; // ʹ�ñ��ʽ���Ƶ��ӳ�
    
    #y x = x + 1;   // ʹ�ñ�ʶ�����ӳٿ���, ��y��ֵ
    
    #(4:5:6) q = 0; // ��С/����/����ӳ�ֵ
end

// ��Ƕ��ֵ�ӳ�
initial
begin
    x = 0; z = 0;
    y = #5 x + z;   // �ڷ����0ʱ��ȡ��x��z��ֵ,����x + z
                    // #5��ֵ��y
end
// ����ʱ������������ӳٿ���, �ﵽͬ����Ч��
reg temp_xz;
initial
begin
    x = 0; z = 0;
    temp_xz = x + z;    // �ڵ�ǰʱ�̼���x + z��ֵ, �Ѽ������洢����ʱ������
    #5 y = temp_xz;     // #5ʱ, ��ֵ��y,�ڼ�ʱ��x��z�仯��Ӱ��yֵ
end

// ���ӳٿ���
initial
begin
    x = 0;
    y = 0;
end
// ��֤���ӳٿ��������ִ��
// ����֤������ӳ�����Ⱥ�˳��
initial
begin
    #0 x = 1;   // ���ӳٿ���
    #0 y = 1;
end

endmodule
