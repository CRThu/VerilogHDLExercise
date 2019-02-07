`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/30 20:03:35
// Design Name: 
// Module Name: task_operation
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

// ����һ����Ϊoperation��ģ��, ���ڲ���һ����Ϊbitwise_oper������
module task_operation;

parameter delay = 10;
reg [15:0] A,B;
reg [15:0] AB_AND, AB_OR, AB_XOR;

always @(A or B)    // ���ۺ�ʱֻҪA����B��ֵ�����ı�
begin
    // ����bitwise_oper����, �������ṩ�����������A��B
    // �������������AB_AND,AB_OR,AB_XOR
    // ������ָ�����밴��������ʱ���������� 
    bitwise_oper(AB_AND, AB_OR, AB_XOR, A, B);
end

// ����bitwise_oper����
task bitwise_oper(output [15:0] ab_and, ab_or, ab_xor,
                  input [15:0] a, b);
/*
task bitwise_oper;
output [15:0] ab_and, ab_or, ab_xor;    // ������������
input [15:0] a, b;  // ���뵽�����еı���
*/
begin
    #delay ab_and = a & b;
    ab_or = a| b;
    ab_xor = a ^ b;
end
endtask

// ����
initial
begin
    #50 A = 16'b10101010_01010101;
    #50 B = 16'b00001111_00111100;
    #50 A = 16'b11001100_11001100;
    #50 $finish;
end

endmodule
