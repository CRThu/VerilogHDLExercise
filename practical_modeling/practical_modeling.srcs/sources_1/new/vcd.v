`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/07 20:24:02
// Design Name: 
// Module Name: vcd
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


module vcd;
// ָ��VCD�ļ���,����ָ��VCD�ļ�,���ɷ�����ָ��һ��Ĭ���ļ���
initial
    $dumpfile("myfile.dmp");    // ������Ϣת����myfile.dmp�ļ�

// ת��ģ���е��ź�
initial
    $dumpvars;  // û��ָ��������Χ, ������е�ȫ���źŶ�ת��
initial
    $dumpvars(1,top);   // ת��ģ��ʵ��top�е��ź�
                        // 1��ʾ��εȼ�,ֵת��top�µĵ�һ���ź�,��topģ���еı���,����ת��top�е��õ�ģ��ı���
initial
    $dumpvars(2,top.m1);    // ת��top.m1ģ������������ź�
initial
    $dumpvars(0,top.m1);    // ��0��ʾת��top.m1ģ�����������������ź�

// ������ֹͣת������
initial
begin
    $dumpon;        // ����ת������
    #1000 $dumpoff; // ֹͣת������
end

// ����һ������,ת������VCD�����ĵ�ǰֵ
initial
    $dumpall;


endmodule
