`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/01 14:08:27
// Design Name: 
// Module Name: task_auto_bitwise_xor
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

// �����Զ�(������)����ģ��
// ������ֻ�г���ģ���е�һС����(������������Ĳ���)
// ��ģ�鹲������ʱ��,clk2��Ƶ����clk������,����clkͬ��
module task_auto_bitwise_xor;

parameter delay = 10;
reg [15:0] cd_xor, ef_xor;  // ����ģ���еı���
reg [15:0] c,d,e,f; // ����ģ���еı���
reg clk=0,clk2=0;

task automatic bitwise_xor;
output [15:0] ab_xor;   // ���������
input [15:0] a,b;   // ���뵽�����еı���
begin
    #delay ab_xor = a ^b;
end
endtask

// ��������always�齫����clk����������ͬʱ����bitwise_xor����
// ��Ϊ������ʱ�ǿ��������,���Բ�����ͨͬʱ��������������
always @(posedge clk)
    bitwise_xor(ef_xor, e, f);

always @(posedge clk2)  // ����Ƶ
    bitwise_xor(cd_xor, c, d);


always
    #50 clk=~clk;
always
    #25 clk2=~clk2;

initial
begin
    c = 16'b0101_1010_1111_0000;
    d = 16'b1100_0011_0011_1100;
    e = 16'b1010_1010_1010_1010;
    f = 16'b1100_1100_0011_0011;
   #200 $finish;
end

endmodule
