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

// 包含自动(可重入)任务模块
// 本例子只列出了模块中的一小部分(即包含任务定义的部分)
// 本模块共有两个时钟,clk2的频率是clk的两倍,并与clk同步
module task_auto_bitwise_xor;

parameter delay = 10;
reg [15:0] cd_xor, ef_xor;  // 顶层模块中的变量
reg [15:0] c,d,e,f; // 顶层模块中的变量
reg clk=0,clk2=0;

task automatic bitwise_xor;
output [15:0] ab_xor;   // 从任务输出
input [15:0] a,b;   // 输入到任务中的变量
begin
    #delay ab_xor = a ^b;
end
endtask

// 下面两个always块将会在clk的正跳变沿同时调用bitwise_xor任务
// 因为该任务时是可以重入的,所以并发的通同时调用能正常运行
always @(posedge clk)
    bitwise_xor(ef_xor, e, f);

always @(posedge clk2)  // 两倍频
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
