`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/23 14:57:21
// Design Name: 
// Module Name: blocking_and_nonblocking_assign
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


module blocking_and_nonblocking_assign;

reg clock;
reg reg1,reg2,reg3;
wire in1,in2,in3;

// ��������ֵ����Ӧ��,ʵ�ֲ�������
// ִ��˳��:
// clock������ʱ, ��������ʽ��ֵ
// #1ʱ, reg1��reg3��ֵ
// clock�½���ʱ, reg2��ֵ
always @(posedge clock)
begin
    reg1 <= #1 in1;
    reg2 <= @(negedge clock) in2^in3;
    reg3 <= #1 reg1;    // reg1�ľ�ֵ
end

// ʹ�÷�������ֵ�����⾺��
reg a,b;
// ˵��1: ʹ�����������������е�always��
always @(posedge clock)
    a = b;
always @(posedge clock)
    b = a;
// ˵��2: ʹ�÷����������������е�always��
always @(posedge clock)
    a <= b;
always @(posedge clock)
    b <= a;

// ʹ��������ֵ���ﵽ��������ֵ��Ŀ��
reg temp_a,temp_b;
// ʹ����ʱ������������ֵ��ģ�·�������ֵ����Ϊ
always @(posedge clock)
begin
    // ������
    // ���Ҳ���ʽ��ֵ������ʱ������
    temp_a = a;
    temp_b = b;
    // д����
    // ����ʱ������ֵ�ŵ���������
    a = temp_b;
    b = temp_a;
end

endmodule
