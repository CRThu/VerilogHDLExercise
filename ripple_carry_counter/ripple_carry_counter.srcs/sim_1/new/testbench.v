`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/29 17:20:41
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


module testbench(

    );
    
    reg clk;
    reg reset;
    wire[3:0] q;
    
    // 引用已经设计好的模块实例
    ripple_carry_counter r1(q,clk,reset);
    
    // 控制驱动设计块的信号, 时钟周期为10个时间单位
    initial
        clk = 1'b0; // 把clk设置为0
    always
        #5 clk = ~clk;  // 每5个时间单位时钟翻转一次
    
    // 控制驱动设计块的reset信号
    initial
    begin
        reset = 1'b1;
        #15 reset = 1'b0;
        #180 reset = 1'b1;
        #10 reset = 1'b0;
        #20 $finish;        // 终止仿真
    end
    
    // 监视输出
    initial
    $monitor($time, " Output q = %d", q);
    
endmodule
