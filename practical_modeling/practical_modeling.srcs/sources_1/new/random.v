`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/07 18:04:53
// Design Name: 
// Module Name: random
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


module random;

reg clock=1'b0;
integer r_seed,r_int;
integer rand1,rand2;

initial
    r_seed = 2; // ���ⶨ�����������Ϊ2

always @(posedge clock)
begin
    r_int = $random(r_seed);// ����32λ����
    rand1 = $random % 60;   // ���� -59~+59
    rand2 = {$random} % 60; // ���� 0~59
    $display("%d %d %d",r_int,rand1,rand2);
end

always
    #10 clock = ~clock;
    
initial
    #200 $finish;

endmodule
