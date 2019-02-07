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

// 顶层激励块
module testbench;

// 声明产生激励输入的变量
reg CLOCK, CLEAR;
wire [3:0] Q;

initial
    $monitor($time," Count Q = %b, Clear = %b", Q[3:0], CLEAR);

// 调用(实例引用)已经设计的模块counter
counter c1(Q, CLOCK, CLEAR);

// 产生清零(CLEAR)的激励信号
initial
begin
    CLEAR = 1'b1;
    #34 CLEAR = 1'b0;
    #200 CLEAR = 1'b1;
    #50 CLEAR = 1'b0;
end

// 产生时钟信号, 每10个单位时间翻转一次
initial
begin
    CLOCK = 1'b0;
    forever #10 CLOCK = ~CLOCK;
end

/*
// always实现
initial
    CLOCK = 1'b0;

always
    #10 CLOCK=~CLOCK;
*/

// 在时间单位位400时刻结束仿真
initial
begin
    #400 $finish;
end

endmodule
