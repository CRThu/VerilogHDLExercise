`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/04 15:22:20
// Design Name: 
// Module Name: ifdef_ifndef_testbench
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


module ifdef_ifndef_testbench;

ifdef_ifndef b1();  // ����������ģ��

`ifdef ADD_B2
    ifdef_ifndef b2();  // ������ADD_B2�ı����־,���������ĵ���b2
`elsif ADD_B3
    ifdef_ifndef b3();  // ������ADD_B3�ı����־,���������ĵ���b3
`else
    ifdef_ifndef b4();  // ��Ĭ�������,,���������ĵ���b4
`endif

`ifndef IGNORE_B5
    ifdef_ifndef b5();  // ��û�ж���IGNORE_B5�ı����־,���������ĵ���b5
`endif

endmodule
