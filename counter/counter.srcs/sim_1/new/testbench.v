`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/22 15:50:25
// Design Name: 
// Module Name: testbench
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

// ���㼤����
module testbench;

// ����������������ı���
reg CLOCK, CLEAR;
wire [3:0] Q;

initial
    $monitor($time," Count Q = %b, Clear = %b", Q[3:0], CLEAR);

// ����(ʵ������)�Ѿ���Ƶ�ģ��counter
counter c1(Q, CLOCK, CLEAR);

// ��������(CLEAR)�ļ����ź�
initial
begin
    CLEAR = 1'b1;
    #34 CLEAR = 1'b0;
    #200 CLEAR = 1'b1;
    #50 CLEAR = 1'b0;
end

// ����ʱ���ź�, ÿ10����λʱ�䷭תһ��
initial
begin
    CLOCK = 1'b0;
    forever #10 CLOCK = ~CLOCK;
end

/*
// alwaysʵ��
initial
    CLOCK = 1'b0;

always
    #10 CLOCK=~CLOCK;
*/

// ��ʱ�䵥λλ400ʱ�̽�������
initial
begin
    #400 $finish;
end

endmodule
