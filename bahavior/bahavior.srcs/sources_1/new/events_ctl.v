`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/23 17:37:14
// Design Name: 
// Module Name: events_ctl
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

// 基于事件的时序控制
module events_ctl;

// 常规时间控制
reg clock;
reg q,d;

initial
begin
    @(clock)    // 只要信号clock的值改变,就执行q=d语句
        q = d;
    @(posedge clock)    // 只要信号clock的值发生正向跳变.0->*/*->1,就执行q=d语句
        q = d;
    @(negedge clock)    // 只要信号clock的值发生负向跳变.1->*/*->0,就执行q=d语句
        q = d;
    q = @(posedge clock) d; // 立即计算d值, 在clock正向跳变沿时刻赋值给q
end

// 命名事件控制
reg last_data_packet;
reg [3:0] data_pkt,data_buf;
event received_data;    // 定义一个名为received_data(接收数据)的事件

always @(posedge clock)
begin
    if(last_data_packet)    // 如果这是最后一组数据
        ->received_data;    // 触发接收数据事件(received_data)
end
always @(received_data)
    data_buf = {data_pkt[0], data_pkt[1], data_pkt[2], data_pkt[3]};    

// OR事件控制(敏感列表)
reg reset;
// 有异步复位的电平敏感锁存器
always @(reset or clock or d)   // 等待复位信号reset,时钟信号clock或输入信号d的改变
begin
    if(reset)   // 若reset信号为高,把q置零
        q = 1'b0;
    else if(clock)  // 若clock信号为高, 锁存输入信号d
        q = d;
end

// or与逗号相同功能
// 使用逗号的敏感列表
always @(reset, clock, d)   // 等待复位信号reset,时钟信号clock或输入信号d的改变
begin
    if(reset)   // 若reset信号为高,把q置零
        q = 1'b0;
    else if(clock)  // 若clock信号为高, 锁存输入信号d
        q = d;
end

// 用reset异步下降沿复位, clock正跳变沿出发的D触发器
always @(posedge clock, negedge reset)  // 使用逗号代替关键字or
    if(!reset)
        q <= 0;
    else
        q <= d;

// @*操作符的使用
reg a,b,c,e,f,g,h,p,m;
reg out1,out2;
// 用or操作符的组合逻辑块编写敏感列表很繁琐,并且容易漏掉一个输入
always @(a or b or c or d or e or f or g or h or p or m)
begin
    out1 = a ? b+c : d+e;
    out2 = f ? g+h : p+m;
end
// 不用上述方法,用符号@(*)来代替,可以把所有输入变量都自动包括进敏感列表
always @(*)
begin
    out1 = a ? b+c : d+e;
    out2 = f ? g+h : p+m;
end

// 电平敏感时序控制
reg count_enable,count;

always
    wait (count_enable)     // 等待电平敏感的条件为真
        #20 count = count + 1;

endmodule
