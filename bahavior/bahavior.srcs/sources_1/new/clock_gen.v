`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/23 13:45:52
// Design Name: 
// Module Name: clock_gen
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

// always语句
module clock_gen(output reg clock);

// 在0时刻把clock变量初始化
initial
    clock = 1'b0;

// 每半个周期把clock信号的值翻转一次(周期=20)
always
    #10 clock = ~clock;

initial
    #1000 $finish;

endmodule
