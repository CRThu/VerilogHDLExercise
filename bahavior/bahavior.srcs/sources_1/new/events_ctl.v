`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/23 17:37:14
// Design Name: 
// Module Name: events_ctl
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

// �����¼���ʱ�����
module events_ctl;

// ����ʱ�����
reg clock;
reg q,d;

initial
begin
    @(clock)    // ֻҪ�ź�clock��ֵ�ı�,��ִ��q=d���
        q = d;
    @(posedge clock)    // ֻҪ�ź�clock��ֵ������������.0->*/*->1,��ִ��q=d���
        q = d;
    @(negedge clock)    // ֻҪ�ź�clock��ֵ������������.1->*/*->0,��ִ��q=d���
        q = d;
    q = @(posedge clock) d; // ��������dֵ, ��clock����������ʱ�̸�ֵ��q
end

// �����¼�����
reg last_data_packet;
reg [3:0] data_pkt,data_buf;
event received_data;    // ����һ����Ϊreceived_data(��������)���¼�

always @(posedge clock)
begin
    if(last_data_packet)    // ����������һ������
        ->received_data;    // �������������¼�(received_data)
end
always @(received_data)
    data_buf = {data_pkt[0], data_pkt[1], data_pkt[2], data_pkt[3]};    

// OR�¼�����(�����б�)
reg reset;
// ���첽��λ�ĵ�ƽ����������
always @(reset or clock or d)   // �ȴ���λ�ź�reset,ʱ���ź�clock�������ź�d�ĸı�
begin
    if(reset)   // ��reset�ź�Ϊ��,��q����
        q = 1'b0;
    else if(clock)  // ��clock�ź�Ϊ��, ���������ź�d
        q = d;
end

// or�붺����ͬ����
// ʹ�ö��ŵ������б�
always @(reset, clock, d)   // �ȴ���λ�ź�reset,ʱ���ź�clock�������ź�d�ĸı�
begin
    if(reset)   // ��reset�ź�Ϊ��,��q����
        q = 1'b0;
    else if(clock)  // ��clock�ź�Ϊ��, ���������ź�d
        q = d;
end

// ��reset�첽�½��ظ�λ, clock�������س�����D������
always @(posedge clock, negedge reset)  // ʹ�ö��Ŵ���ؼ���or
    if(!reset)
        q <= 0;
    else
        q <= d;

// @*��������ʹ��
reg a,b,c,e,f,g,h,p,m;
reg out1,out2;
// ��or������������߼����д�����б�ܷ���,��������©��һ������
always @(a or b or c or d or e or f or g or h or p or m)
begin
    out1 = a ? b+c : d+e;
    out2 = f ? g+h : p+m;
end
// ������������,�÷���@(*)������,���԰���������������Զ������������б�
always @(*)
begin
    out1 = a ? b+c : d+e;
    out2 = f ? g+h : p+m;
end

// ��ƽ����ʱ�����
reg count_enable,count;

always
    wait (count_enable)     // �ȴ���ƽ���е�����Ϊ��
        #20 count = count + 1;

endmodule
