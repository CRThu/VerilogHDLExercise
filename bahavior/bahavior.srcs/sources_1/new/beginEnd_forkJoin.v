`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/24 23:37:54
// Design Name: 
// Module Name: beginEnd_forkJoin
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


module beginEnd_forkJoin;

// ˳���
reg x,y;
reg [1:0] z,w;

initial
begin
    x = 1'b0;
    y = 1'b1;
    z = {x,y};
    w = {y,x};
end
// ���ӳٵ�˳���
initial
begin
    x = 1'b0;       // #0
    #5 y = 1'b1;    // #5
    #10 z = {x,y};  // #15
    #20 w = {y,x};  // #35 
end

// ���п�
// ���ӳٵĲ��п�
initial
fork
    x = 1'b0;       // #0
    #5 y = 1'b1;    // #5
    #10 z = {x,y};  // #10
    #20 w = {y,x};  // #20
join
// �������뾺�������Ĳ��п�
initial
fork
    x = 1'b0;
    y = 1'b1;
    z = {x,y};  // ����
    w = {y,x};  // ����
join

// Ƕ�׿�
initial
begin
    x = 1'b0;
    fork
        #5 y = 1'b1;
        #10 z = {x,y};
    join
    #20 w = {y,x};
end

// ������
initial
begin: block1   // ����Ϊblock1��˳��������
    integer i;  // ���ͱ���i��block1������ľ�̬���ر���
                // ��ͨ�������top.block1.i������ģ�����
end

initial
fork: block2    // ����Ϊblock2�Ĳ���������
    reg i;  // �Ĵ�������i��block2������ľ�̬����
            // ����ͨ�������top.block2.i������ģ�����
join

initial
begin: block3
    if(block1.i == 1)
        disable block3; // ���Խ���block3
end

endmodule
