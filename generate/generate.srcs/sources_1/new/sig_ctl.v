`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/27 14:09:48
// Design Name: 
// Module Name: sig_ctl
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

`define TRUE  1'b1
`define FALSE 1'b0

// �ӳ�
`define Y2RDELAY 3  // �Ƶ�ת����ӳ�
`define R2GDELAY 2  // ���ת�̵��ӳ�

module sig_ctl(hwy, cntry, X, clock, clear);

// ����/����˿�����
output [1:0] hwy,cntry; // ��ʾ����״̬����λ���: G Y R
reg [1:0] hwy,cntry;    // ��������ź�Ϊ�Ĵ�������

input X;                // ��Ϊ��(TRUE),��ʾ������ͨ����幫·,����Ϊ��(FALSE)
input clock,clear;

parameter  RED = 2'd0,  // ��ͨ��״̬
            YELLOW = 2'd1,
            GREEN = 2'd2;

// ״̬����                 HWY     CNTRY
parameter  S0 = 3'd0,  // GREEN     RED
            S1 = 3'd1,  // YELLOW    RED
            S2 = 3'd2,  // RED       RED
            S3 = 3'd3,  // RED       GREEN
            S4 = 3'd4;  // RED       YELLOW

// �ڲ�״̬����
reg [2:0] state,next_state;

// ״ֻ̬����ʱ���źŵ��������ظı�
always @(posedge clock)
    if(clear)
        state <= S0;    // ������״̬��S0��ʼ
    else
        state <= next_state;    // ״̬�ĸı�

// ������·�źź���幫·�źŵ�ֵ
always @(state)
begin
    hwy = GREEN;    // Ĭ�ϵ���·�źŵ���ɫ��ֵ
    cntry = RED;    // Ĭ�ϵ���幫·�źŵ���ɫ��ֵ
    case(state)
        S0: ;  // û�иı�,��Ĭ��ֵ
        S1: hwy = YELLOW;
        S2: hwy = RED;
        S3: begin
                hwy = RED;
                cntry = GREEN;
            end
        S4: begin
                hwy = RED;
                cntry = YELLOW;
            end
    endcase
end

// ��case��������״̬��
always @(state or X)
begin
    case(state)
        S0: if(X)
                next_state = S1;
            else
                next_state = S0;
        S1: begin   // �ӳټ�����������ʱ��
                repeat(`Y2RDELAY) @(posedge clock);
                next_state = S2;
            end
        S2: begin   // �ӳټ�����������ʱ��
                repeat(`R2GDELAY) @(posedge clock);
                next_state = S3;
            end
        S3: if(X)
                next_state = S3;
            else
                next_state = S4;
        S4: begin   // �ӳټ�����������ʱ��
                repeat(`Y2RDELAY) @(posedge clock);
                next_state = S0;
            end
        default: next_state = S0;
    endcase;
end

endmodule
