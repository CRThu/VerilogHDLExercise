`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/04 14:28:09
// Design Name: 
// Module Name: defparam_parameter
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


module defparam_parameter;
// Ĭ�ϵĲ���ֵ
parameter delay1 = 2;
parameter delay2 = 3;
parameter delay3 = 7;

parameter id_num = 0;   // ����ģ��ı�ʶ��Ϊ0

initial // ��ʾģ���ʶ��
    $display("Displaying hello_world id number = %d", id_num);
    
initial // ��ʾdelayֵ
    $display("delay : %d,%d,%d", delay1, delay2, delay3);

endmodule
