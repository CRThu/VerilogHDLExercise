`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/28 21:31:42
// Design Name: 
// Module Name: D_FF
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

// 带异步复位的D触发器(D_FF)
module D_FF(
output reg q,
input d,
input clk,
input reset
    );
    
    always@(posedge reset or negedge clk)
    if(reset)
        q <= 1'b0;
    else
        q <= d;
endmodule
