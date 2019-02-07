`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/27 15:12:03
// Design Name: 
// Module Name: sig_ctl_testbench
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

`define TRUE  1'b1
`define FALSE 1'b0

module sig_ctl_testbench;

wire [1:0] MAIN_SIG,CNTRY_SIG;
reg CAR_ON_CNTRY_RD;    // 若为真(TRUE),表明乡村公路上有车
reg CLOCK,CLEAR;

// 调用(实例引用)交通信号灯控制器模块
sig_ctl SC(MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, CLOCK, CLEAR);

// 设置监视系统任务
initial
    $monitor($time," Main Sig = %b, Country Sig = %b, Car_on_cntry = %b", MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD);

// 设置时钟
initial
begin
    CLOCK = `FALSE;
    forever #5 CLOCK = ~CLOCK;
end

// 控制清零信号
initial
begin
    CLEAR = `TRUE;
    repeat(5) @(negedge CLOCK);
    CLEAR = `FALSE;
end

// 施加激励信号
initial
begin
    CAR_ON_CNTRY_RD = `FALSE;
    
    repeat(20) @(negedge CLOCK);    CAR_ON_CNTRY_RD = `TRUE;
    repeat(10) @(negedge CLOCK);    CAR_ON_CNTRY_RD = `FALSE;
    
    repeat(20) @(negedge CLOCK);    CAR_ON_CNTRY_RD = `TRUE;
    repeat(10) @(negedge CLOCK);    CAR_ON_CNTRY_RD = `FALSE;
    
    repeat(20) @(negedge CLOCK);    CAR_ON_CNTRY_RD = `TRUE;
    repeat(10) @(negedge CLOCK);    CAR_ON_CNTRY_RD = `FALSE;
    
    repeat(10) @(negedge CLOCK);    $stop;
end

endmodule
