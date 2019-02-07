`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/24 14:16:58
// Design Name: 
// Module Name: loop_statement
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


module loop_statement;

// whileѭ��
// ����������count��0���ӵ�127����ʾcount����
integer count;
initial
begin
    count = 0;
    while (count < 128)
    begin
        $display("Count = %d", count);
        count = count + 1;
    end
end

// �ڱ�־����flag��(�����λ��)Ѱ�ҵ�һ��ֵΪ1��λ
`define TRUE 1'b1
`define FALSE 1'b0
reg [15:0] flag;
integer i;  // ���������ڼ���
reg continue;

initial
begin
    flag = 16'b0010_0000_0000_0000;
    i = 0;
    continue = `TRUE;
    
    while((i<16) && continue)   // �ò������Ķ����������while���ʽ
    begin
        if(flag[i])
        begin
            $display("Encounterd a TURE bit at element number %d",i);
            continue = `FALSE;
        end
         i = i +1;
    end
end

// forѭ��
integer count2;
initial
begin
    for(count2=0 ; count2<128 ; count2=count2+1)
        $display("Count2 = %d",count2);
end

// ����Ԫ�صĳ�ʼ��
`define MAX_STATES 32
integer state [0:`MAX_STATES-1]; // ����������state����Ԫ��state[0]��state[31] 

initial
begin
    for(i=0 ; i<32 ; i=i+2) // ������żԪ�س�ʼ��Ϊ0
        state[i] = 0;
    for(i=1 ; i<32 ; i=i+2) // ������żԪ�س�ʼ��Ϊ1
        state[i] = 1;
end

// repeatѭ��
// ��0���ӵ�127��������ʾ
integer count3;
initial
begin
    count3 = 0;
    repeat(128)
    begin
        $display("Count3 = %d", count3);
        count3 = count3 + 1;
    end
end

// ���ݻ���ģ�����
// �յ�data_start�źź�, ���8��ʱ�����ڶ�������
// module data_buffer(data_start, data, clock);
parameter cycles = 8;

reg data_start = 1;
reg [15:0] data;
reg clock;
reg [15:0] buffer [0:7];

always @(posedge clock)
begin
    if(data_start)  // data_start�ź�Ϊ��
    begin
        i = 0;
        repeat(cycles)  // �ڽ�������8��ʱ�����ڵ��������ش洢����
        begin
            @(posedge clock)buffer[i] = data;   // �ȴ���һ���������صĵ�����������
            i = i + 1;
        end
    end
end

// foreverѭ��
// ��foreverѭ��, ����always��
initial
begin
    clock = 1'b0;
    forever #10 clock = ~clock; // ʱ������Ϊ20����λʱ��
end

// ��ÿ��ʱ���������س��޸�����
initial
begin
    data = 16'b1111_0111_0011_0001;
    forever @(posedge clock) data = data >> 2;
end

endmodule
