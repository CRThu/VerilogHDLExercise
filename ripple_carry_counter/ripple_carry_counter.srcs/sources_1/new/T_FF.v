`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/28 21:38:04
// Design Name: 
// Module Name: T_FF
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


module T_FF(
output q,
input clk,
input reset
    );
    
    wire d;
    
    D_FF dff0(q,d,clk,reset);
    not n1(d,q);        // 非门(not)是Verilog语言内置原语部件(primitive)
endmodule
