`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/01 15:39:30
// Design Name: 
// Module Name: func_parity
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

// ����һ��ģ��,���а����ܼ���żУ��λ�ĺ���calc_parity
module func_parity;

reg [31:0] addr;
reg parity;

// ÿ����ֵַ�����仯,�����µ�żУ��λ
always @(addr)
begin
    parity = calc_parity(addr);     // ��һ������У��λ���㺯��calc_parity
    $display("Parity calculated = %b", calc_parity(addr));  // �ڶ�������У��λ���㺯��calc_parity
end

// ����żУ��λ���㺯��
function calc_parity(input [31:0] address);
/*
function calc_parity;
input [31:0] address;
*/
begin
    // �ʵ����������ֵ,ʹ���������ڲ��Ĵ���calc_parity
    calc_parity = ^address; // �������Ե�ַλ�����ֵ
end
endfunction

initial
    addr = 0;

always
    #10 addr = addr + 1;
    
initial
    #100 $finish;

endmodule
