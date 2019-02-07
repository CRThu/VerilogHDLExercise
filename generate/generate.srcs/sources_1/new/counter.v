`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/26 18:36:24
// Design Name: 
// Module Name: counter
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

// ��λ�����Ƽ�����
module counter(Q, clock, clear);

// ����/����˿�
output [3:0] Q;
input clock, clear;
// �������Q������Ϊ�Ĵ�������
reg[3:0] Q;

always @(posedge clear or negedge clock)
begin
    if(clear)
        Q <= 4'd0;  // Ϊ�����������紥����һ���ʱ���߼�, ����ʹ�÷�������ֵ
    else
        Q <= Q + 1; // Q��һ����λ�ļĴ���, ��������15֮���ֻ����, ���ģ16û�б�Ҫ
end

endmodule
