`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/03 16:37:11
// Design Name: 
// Module Name: func_constant_signed
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


module func_constant_signed;

parameter RAM_DEPTH = 256;
reg [clogb2(RAM_DEPTH)-1:0] addr_bus; // ͨ���������涨��ĺ����õ�clogb2=8,�൱��input[7:0] addr_bus;

// ��������
function integer clogb2(input integer depth);
begin
    for(clogb2=0;depth>1;clogb2=clogb2+1)
        depth = depth >> 1;
end
endfunction

// �����ŵĺ�������
// ����һ��64λ��������
function signed [63:0] compute_signed(input [63:0] vector);
    compute_signed = vector;
endfunction

reg [63:0] v1;
always @(v1)
begin
    if(compute_signed(v1) < -3)
        $display($time," compute_signed(vector) < -3");
    else
        $display($time," compute_signed(vector) >= -3");
end

initial
begin
    #5 v1=5;
    #5 v1=-5;
    
    #5 $finish;
end

endmodule
