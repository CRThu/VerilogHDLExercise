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

// 非阻塞赋值语句的应用,实现并发传输
// 执行顺序:
// clock上升沿时, 计算各表达式右值
// #1时, reg1和reg3赋值
// clock下降沿时, reg2赋值
always @(posedge clock)
begin
    reg1 <= #1 in1;
    reg2 <= @(negedge clock) in2^in3;
    reg3 <= #1 reg1;    // reg1的旧值
end

// 使用非阻塞赋值来避免竞争
reg a,b;
// 说明1: 使用阻塞语句的两个并行的always块
always @(posedge clock)
    a = b;
always @(posedge clock)
    b = a;
// 说明2: 使用非阻塞语句的两个并行的always块
always @(posedge clock)
    a <= b;
always @(posedge clock)
    b <= a;

// 使用阻塞赋值来达到非阻塞赋值的目的
reg temp_a,temp_b;
// 使用临时变量和阻塞赋值来模仿非阻塞赋值的行为
always @(posedge clock)
begin
    // 读操作
    // 把右侧表达式的值放在临时变量中
    temp_a = a;
    temp_b = b;
    // 写操作
    // 把临时变量的值放到左侧变量中
    a = temp_b;
    b = temp_a;
end

endmodule
