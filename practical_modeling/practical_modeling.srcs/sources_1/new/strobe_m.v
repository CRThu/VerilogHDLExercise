`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/07 17:29:13
// Design Name: 
// Module Name: strobe_m
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


module strobe_m;

initial
    $display("Displaying in %m");   // 显示层次信息
    

// 选通显示
reg clock=1'b0;
reg a;
reg b=1'b1;
always @(posedge clock)
    a = b;

always @(posedge clock)
    $strobe("Displaying a = %b", a);  // 显示正跳变时刻的值

initial
    #10 clock=1'b1;

endmodule