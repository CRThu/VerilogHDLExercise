`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/26 17:29:00
// Design Name: 
// Module Name: ripple_adder_testbench
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


module ripple_adder_testbench;

reg [3:0] a,b;
reg ci;
wire [3:0] sum;
wire co;

ripple_adder a1(co,sum,a,b,ci);

initial
begin
    ci= 0;
    a = 4'b1101;
    b = 4'b1110;
    #10 $finish; 
end
endmodule
