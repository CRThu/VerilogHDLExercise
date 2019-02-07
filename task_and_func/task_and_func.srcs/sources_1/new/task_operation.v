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

// 定义一个名为operation的模块, 其内部有一个名为bitwise_oper的任务
module task_operation;

parameter delay = 10;
reg [15:0] A,B;
reg [15:0] AB_AND, AB_OR, AB_XOR;

always @(A or B)    // 无论何时只要A或者B的值发生改变
begin
    // 启动bitwise_oper任务, 该任务提供两个输入变量A和B
    // 有三个输出变量AB_AND,AB_OR,AB_XOR
    // 变量的指定必须按照任务定义时的声明次序 
    bitwise_oper(AB_AND, AB_OR, AB_XOR, A, B);
end

// 定义bitwise_oper任务
task bitwise_oper(output [15:0] ab_and, ab_or, ab_xor,
                  input [15:0] a, b);
/*
task bitwise_oper;
output [15:0] ab_and, ab_or, ab_xor;    // 任务的输出变量
input [15:0] a, b;  // 输入到任务中的变量
*/
begin
    #delay ab_and = a & b;
    ab_or = a| b;
    ab_xor = a ^ b;
end
endtask

// 激励
initial
begin
    #50 A = 16'b10101010_01010101;
    #50 B = 16'b00001111_00111100;
    #50 A = 16'b11001100_11001100;
    #50 $finish;
end

endmodule
