`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/21 18:37:30
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


module testbench;

reg [3:0] A, B;
reg C_IN;
wire [3:0] SUM1, SUM2, SUM3;
wire C_OUT1, C_OUT2, C_OUT3;

// 调用(实例引用)四位全加器,把它命名为FA1_4
fulladd4 FA1_4_1(SUM1, C_OUT1, A, B, C_IN);
logic1_fulladd4 FA1_4_2(SUM2, C_OUT2, A, B, C_IN);
logic2_fulladd4 FA1_4_3(SUM3, C_OUT3, A, B, C_IN);

// 设置信号值的监视
initial
begin
    $monitor($time," A = %b, B = %b, C_IN = %b --- C_OUT = %b, SUM = %b", A, B, C_IN, C_OUT1, SUM1);
end

// 激励信号的输入
initial
begin
    A = 4'd0; B = 4'd0; C_IN = 1'b0;
    #5 A = 4'd3; B = 4'd4;
    #5 A = 4'd2; B = 4'd5;
    #5 A = 4'd9; B = 4'd9;
    #5 A = 4'd10; B = 4'd15;
    #5 A = 4'd10; B = 4'd5; C_IN = 1'b1;
    #5 $finish;
end

endmodule
