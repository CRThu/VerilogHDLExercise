`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/30 20:32:27
// Design Name: 
// Module Name: task_sequence
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

// ���������Ϊasymmetric_sequence�������ģ��
module task_sequence;

reg clock;

initial
    init_sequence;  // ����init_sequence����

always
    asymmetric_sequence;    // ����asymmetric_sequence����

// ������Ϊinit_sequence(��ʼ������)������
task init_sequence;
begin
    clock = 1'b0;
end
endtask

// �����ܲ����ǶԳ����е�����
// ֱ�Ӹ���ģ���ж��������������ʱ��(clock)�ź�
task asymmetric_sequence;
begin
    #12 clock = 1'b0;
    #5 clock = 1'b1;
    #3 clock = 1'b0;
    #10 clock = 1'b1;
end
endtask

endmodule
