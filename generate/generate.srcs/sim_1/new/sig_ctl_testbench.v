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
reg CAR_ON_CNTRY_RD;    // ��Ϊ��(TRUE),������幫·���г�
reg CLOCK,CLEAR;

// ����(ʵ������)��ͨ�źŵƿ�����ģ��
sig_ctl SC(MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, CLOCK, CLEAR);

// ���ü���ϵͳ����
initial
    $monitor($time," Main Sig = %b, Country Sig = %b, Car_on_cntry = %b", MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD);

// ����ʱ��
initial
begin
    CLOCK = `FALSE;
    forever #5 CLOCK = ~CLOCK;
end

// ���������ź�
initial
begin
    CLEAR = `TRUE;
    repeat(5) @(negedge CLOCK);
    CLEAR = `FALSE;
end

// ʩ�Ӽ����ź�
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
