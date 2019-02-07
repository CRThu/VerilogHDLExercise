`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/23 19:22:35
// Design Name: 
// Module Name: if_statement
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

// �������
module if_statement;

parameter MAX_Q_DEPTH = 16;
reg lock,enable;
reg buffer,data,out,in;
reg data_quene,number_quened;
reg alu_control,x,y,z;

initial
begin
    // ��һ���������
    if(!lock)
        buffer = data;
    if(enable)
        out = in;
        
    // �ڶ����������
    if(number_quened < MAX_Q_DEPTH)
    begin
        data_quene = data;
        number_quened = number_quened + 1;
    end
    else
        $display("Quene Full.Try again");

    // �������������
    // ���ݲ�ͬ�������߼���Ԫ�Ŀ����ź�alu_controlִ�в�ͬ�������������
    if(alu_control == 0)
        y = x + z;
    else if(alu_control == 1)
        y = x - z;
    else if(alu_control == 2)
        y = x * z;
    else
        $display("Invalid ALU control signal");
end

endmodule
