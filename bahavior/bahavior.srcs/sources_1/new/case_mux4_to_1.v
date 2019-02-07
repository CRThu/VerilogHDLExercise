`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/23 20:40:55
// Design Name: 
// Module Name: case_mux4_to_1
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


module case_mux4_to_1(output reg out, input i0,i1,i2,i3, input s1,s0);
always @(s1 or s0 or i0 or i1 or i2 or i3)
    case ({s1, s0}) // 开关变量是由两个控制信号拼接而成的
        2'd0 : out = i0;
        2'd1 : out = i1;
        2'd2 : out = i2;
        2'd3 : out = i3;
        default: $display("Invalid control signals");
    endcase
endmodule
