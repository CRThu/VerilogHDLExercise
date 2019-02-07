`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/03 17:53:29
// Design Name: 
// Module Name: assign_deassign_testbench
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


module assign_deassign_testbench;

reg D,CLK,RESET;
wire Q;

assign_deassign d(Q,, D, CLK, RESET);

always
    #10 CLK = ~CLK;

always
    #25 D = ~D;
        
initial
begin
    D=1; CLK=0; RESET=0;
    #150 RESET=1;
    #50 RESET=0;
    #200 $finish;
end

endmodule
