`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/29 17:20:41
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


module testbench(

    );
    
    reg clk;
    reg reset;
    wire[3:0] q;
    
    // �����Ѿ���ƺõ�ģ��ʵ��
    ripple_carry_counter r1(q,clk,reset);
    
    // ����������ƿ���ź�, ʱ������Ϊ10��ʱ�䵥λ
    initial
        clk = 1'b0; // ��clk����Ϊ0
    always
        #5 clk = ~clk;  // ÿ5��ʱ�䵥λʱ�ӷ�תһ��
    
    // ����������ƿ��reset�ź�
    initial
    begin
        reset = 1'b1;
        #15 reset = 1'b0;
        #180 reset = 1'b1;
        #10 reset = 1'b0;
        #20 $finish;        // ��ֹ����
    end
    
    // �������
    initial
    $monitor($time, " Output q = %d", q);
    
endmodule
