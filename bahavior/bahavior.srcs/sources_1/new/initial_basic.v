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

// initial���
module initial_basic;

reg x,y,a,b,m;

initial
    m = 1'b0;   // ֻ��һ�����,����Ҫʹ��begin-end

initial
begin
    #5 a = 1'b1;    // �������,��Ҫʹ��begin-end
    #25 b = 1'b0;
end

initial
begin
    #10 x = 1'b0;
    #25 y = 1'b1;
end

// ִ��˳��: m -> a -> x -> b -> y

initial
    #50 $finish;

endmodule
