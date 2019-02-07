`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/01 21:10:02
// Design Name: 
// Module Name: basic
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


module basic(
clk
    );
    // ע��
    // ����ע��
    /*����ע��*/
    
    // ����
    reg a = 4'b1111;    // 4λ2������
    reg b = 12'habc;    // 12λ16������
    reg c = 16'd255;    // 16λ10������
    
    reg d = 23456;      // 32λ10������
    reg e = 'hc3;       // 32λ16������
    reg f = 'o21;       // 32λ8������
    
    reg g = 12'h13x;    // 12λ16������, ���4λ��ȷ��
    reg h = 6'hx;       // 6λ16������,����λ��ȷ��
    reg i = 32'bz;      // 32λ����ֵ
    
    reg j = -6'd3;      // 6λ�����Ʋ����ʾ3,��ʾ����
    reg k = -6'sd3;     // 6λ���ڴ�������������ĸ���
    
    reg l = 12'b1111_0000_1111;      // _�ɺ���
    reg m = 4'b10??;     // = 4'b10zz
    
    reg n = "Hello world";
    reg o = "a / b";
    
    // ��ʶ��/�ؼ���
    reg value;
    input clk;
    
    // ��������
    
    // ֵ������
    // 0 ��
    // 1 ��
    // x ��ȷ��
    // z ����/����
    
    // ǿ�ȵȼ�
    // supply   ����
    // strong   ����
    // pull     ����
    // large    �洢
    // weak     ����
    // medium   �洢
    // small    �洢
    // highz    ����
    
    // ����
    wire wa;
    wire wb,wc;
    wire wd = 1'b0;
    
    // �Ĵ���
    reg reset;  // �����ܱ�����ֵ�ı���reset
    initial
    begin
        reset = 1'b1;       // ��reset��ʼ��Ϊ1, ʹ���ֵ�·��λ
        #100 reset = 1'b0;  // ����100ʱ�䵥λ����0
    end
    
    reg signed [63:0] rm;   // 64λ������ֵ
    integer ii;             // 32λ������ֵ
    
    // ����
    wire va;                 // ������������, Ĭ��
    wire[7:0] vbus;          // 8λ����
    wire[31:0] vbusA,vbusB,vbusC;   // ����32λ������
    reg vclock;              // �����Ĵ���, Ĭ��
    reg[0:40] vvitural_addr; // �����Ĵ���, 41λ�������ַ
    
    // vbusA[7]              // ����vbusA�ĵ���λ
    // vbus[2:0]             // ����vbus�������λ
    // vvitural_addr[0:1]    // ����vvirtual_addr���������λ 
    
    reg [255:0] vdata1;       // data1[255]�������Чλ
    reg [0:255] vdata2;       // data2[0]�������Чλ
    reg [7:0] vbyte;
    integer byteNum=1;
    
    initial
    begin
        vbyte=vdata1[31-:8];   // �ӵ�31λ����, ���Ϊ8λ, �൱��vdata1[31:24]
        vbyte=vdata1[24+:8];   // �ӵ�24λ����, ���Ϊ8λ, �൱��vdata1[31:24]
        vbyte=vdata2[31-:8];   // �ӵ�31λ����, ���Ϊ8λ, �൱��vdata2[24:31]
        vbyte=vdata2[24+:8];   // �ӵ�24λ����, ���Ϊ8λ, �൱��vdata2[24:31]
    
        for(j=0;j<31;j=j+1)
            vbyte=vdata1[(j*8)+:8]; // ������[7:0],[15:8],...,[255,248]
    
    // ���ڳ�ʼ��������һ����
        vdata1[(byteNum*8)+:8]=8'b0;  // ���byteNum=1,����8λ������,[15:8]
    end
    
    // ����
    integer counter;          // һ����;�ı���, ��Ϊ������
    initial
        counter=-1;            // ��-1�洢����������
        
    // ʵ��
    real delta;               // ����һ����Ϊdelta��ʵ�ͱ���
    initial
    begin
        delta=4e10;            // delta����ֵ, �ÿ�ѧ��������ʾ
        delta=2.13;            // delta����ֵΪ2.13
    end
    integer inti;             // ����һ����Ϊinti�����ͱ���
    initial
        inti=delta;            // i�õ�ֵ2(2.13ȡ��������)

    // ʱ��
    time save_sim_time;        // ����ʱ�����͵ı���save_sim_time
    initial
        save_sim_time= $time;  // �ѵ�ǰ�ķ���ʱ���¼����
    
    // ����
    integer count[0:7];        // ��8��������������ɵ�����
    reg bool[31:0];             // ��32��һλ�����Ĵ���������ɵ�����
    time chk_point[1:100];      // ��100��ʱ���������ɵ�����
    reg[4:0] port_id[0:7];      // ��8���˿ڱ�ʶ������ɵ�����, �˿ڱ�����λ��Ϊ5
    integer matrix[4:0][0:255]; // ��ά������������
    reg[63:0] array_4d[15:0][7:0][7:0][255:0];  // ��ά64λ�Ĵ���������
    wire[7:0] w_array2[5:0];    // ����8λ����������
    wire w_array1[7:0][5:0];    // ����1λ���ͱ����Ķ�ά����
    
    initial
    begin
        count[5]=0;              // ��count�����еĵ�5��������Ԫ(32λ)��λ
        chk_point[100]=0;        // ��chk_point�����еĵ�100��ʱ���͵�Ԫ(64λ)��λ
        port_id[3]=0;            // ��port_id�����еĵ�3���Ĵ�����Ԫ(5λ)��λ
        
        matrix[1][0]=35559;      // �������е�1�е�0�е������͵�Ԫ(32λ)��Ϊ33559
        array_4d[0][0][0][0][15:0]=0;   // ����ά�����е�������λ[0][0][0][0]�ļĴ����͵�Ԫ��0~15λ����Ϊ0
        
        // �Ƿ�
        // port_id=0;            // �Ƿ�, ��ͼд��������
        // matrix[1]=0;          // �Ƿ�, ��ͼд������2��
    end
    
    // �洢��
    reg mem1bit[0:1023];        // 1K��һλ�洢��mem1bit
    reg[7:0] membyte[0:1023];   // 1K���ֽ�(8λ)�洢��membyte
    initial
        membyte[511]=0;         // ȡ���洢��membyte�е�ַ511��������ֽ�
    
    // ����
    parameter paraport_id=5;            // ���峣��port_idΪ5
    parameter cache_line_width=256;     // ������ٻ��������߿��Ϊ����256
    parameter signed [15:0] WIDTH=0;    // �Ѳ���WIDTH�涨Ϊ��������,���Ϊ16λ
    // �ֲ�����
    localparam  state1=4'b0001,
                state2=4'b0010,
                state3=4'b0100,
                state4=4'b1000;
    // �ַ���
    reg [8*18:1] string_value;  // ��������string_value,����Ϊ18���ֽ�
    initial
        string_value="Hello Verilog World"; // �ַ������Դ洢�ڱ�����
    
    initial
    begin
        $display("Hello Verilog World");
        $display($time);
        $display("time:%d,value:%h",$time,virtual_addr);
        $display("ID:%b",port_id);
        $display("This string is displayed from %m level of hierarchy");
        $display("This is a\n multiline string with a %% sign");
        $monitor($time,"value:%b,reset=%b",clock,reset);
        
        #100 $stop;
        #900 $finish;
    end
    
    `define WORD_SIZE 32
    `define S $stop
    `define WORD_REG reg [31:0]
    
    `include "header.v"
    
endmodule
