`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/23 13:21:10
// Design Name: 
// Module Name: initial_basic
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

// initial语句
module initial_basic;

reg x,y,a,b,m;

initial
    m = 1'b0;   // 只有一条语句,不需要使用begin-end

initial
begin
    #5 a = 1'b1;    // 多条语句,需要使用begin-end
    #25 b = 1'b0;
end

initial
begin
    #10 x = 1'b0;
    #25 y = 1'b1;
end

// 执行顺序: m -> a -> x -> b -> y

initial
    #50 $finish;

endmodule
