`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/03 18:09:43
// Design Name: 
// Module Name: force_release
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


module force_release;

reg D,CLK,RESET;
wire Q,QBar;

// ����(ʵ������)��D������
assign_deassign d1(Q,QBar,D,CLK,RESET);

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

// �����ڼĴ����ϵ�force��release
initial
begin
    // ���������������ʱ�䵥λ50��100֮���dff.qǿ�Ƹ�ֵ1
    // ������edge_dff��������ʵ�����
    #50 force assign_deassign.q = 1'b1;
    #100 release assign_deassign.q;
end

// �����������ϵ�force��release
reg a=1, b=0, c=1;
wire out;
assign out = a & b & c;

initial
begin
    #50 force out = a | b & c;
    #50 release out;
end

endmodule
