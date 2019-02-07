`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/18 15:35:26
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

wire q,qbar;
reg set,reset;

SR_latch m1(q, qbar, ~set, ~reset);

initial
begin
    $monitor($time, " set = %b, reset = %b, q = %b\n", set, reset, q);
    set=0;
    reset=0;
    #5 reset=1;
    #5 reset=0;
    #5 set=1;
    #5 $finish;
end

endmodule
