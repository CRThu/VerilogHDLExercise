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
    // 注释
    // 单行注释
    /*多行注释*/
    
    // 声明
    reg a = 4'b1111;    // 4位2进制数
    reg b = 12'habc;    // 12位16进制数
    reg c = 16'd255;    // 16位10进制数
    
    reg d = 23456;      // 32位10进制数
    reg e = 'hc3;       // 32位16进制数
    reg f = 'o21;       // 32位8进制数
    
    reg g = 12'h13x;    // 12位16进制数, 最低4位不确定
    reg h = 6'hx;       // 6位16进制数,所有位不确定
    reg i = 32'bz;      // 32位高阻值
    
    reg j = -6'd3;      // 6位二进制补码表示3,表示负数
    reg k = -6'sd3;     // 6位用于带符号算术运算的负数
    
    reg l = 12'b1111_0000_1111;      // _可忽略
    reg m = 4'b10??;     // = 4'b10zz
    
    reg n = "Hello world";
    reg o = "a / b";
    
    // 标识符/关键字
    reg value;
    input clk;
    
    // 数据类型
    
    // 值的种类
    // 0 假
    // 1 真
    // x 不确定
    // z 高阻/浮动
    
    // 强度等级
    // supply   驱动
    // strong   驱动
    // pull     驱动
    // large    存储
    // weak     驱动
    // medium   存储
    // small    存储
    // highz    高阻
    
    // 线网
    wire wa;
    wire wb,wc;
    wire wd = 1'b0;
    
    // 寄存器
    reg reset;  // 声明能保持数值的变量reset
    initial
    begin
        reset = 1'b1;       // 把reset初始化为1, 使数字电路复位
        #100 reset = 1'b0;  // 经过100时间单位后置0
    end
    
    reg signed [63:0] rm;   // 64位带符号值
    integer ii;             // 32位带符号值
    
    // 向量
    wire va;                 // 标量线网变量, 默认
    wire[7:0] vbus;          // 8位总线
    wire[31:0] vbusA,vbusB,vbusC;   // 三条32位宽总线
    reg vclock;              // 标量寄存器, 默认
    reg[0:40] vvitural_addr; // 向量寄存器, 41位宽虚拟地址
    
    // vbusA[7]              // 向量vbusA的第七位
    // vbus[2:0]             // 向量vbus的最低三位
    // vvitural_addr[0:1]    // 向量vvirtual_addr的两个最高位 
    
    reg [255:0] vdata1;       // data1[255]是最高有效位
    reg [0:255] vdata2;       // data2[0]是最高有效位
    reg [7:0] vbyte;
    integer byteNum=1;
    
    initial
    begin
        vbyte=vdata1[31-:8];   // 从第31位算起, 宽度为8位, 相当于vdata1[31:24]
        vbyte=vdata1[24+:8];   // 从第24位算起, 宽度为8位, 相当于vdata1[31:24]
        vbyte=vdata2[31-:8];   // 从第31位算起, 宽度为8位, 相当于vdata2[24:31]
        vbyte=vdata2[24+:8];   // 从第24位算起, 宽度为8位, 相当于vdata2[24:31]
    
        for(j=0;j<31;j=j+1)
            vbyte=vdata1[(j*8)+:8]; // 次序是[7:0],[15:8],...,[255,248]
    
    // 用于初始化向量的一个域
        vdata1[(byteNum*8)+:8]=8'b0;  // 如果byteNum=1,共有8位被清零,[15:8]
    end
    
    // 整数
    integer counter;          // 一般用途的变量, 作为计数器
    initial
        counter=-1;            // 把-1存储到计数器中
        
    // 实数
    real delta;               // 定义一个名为delta的实型变量
    initial
    begin
        delta=4e10;            // delta被赋值, 用科学计数法表示
        delta=2.13;            // delta被赋值为2.13
    end
    integer inti;             // 定义一个名为inti的整型变量
    initial
        inti=delta;            // i得到值2(2.13取整数部分)

    // 时间
    time save_sim_time;        // 定义时间类型的变量save_sim_time
    initial
        save_sim_time= $time;  // 把当前的仿真时间记录下来
    
    // 数组
    integer count[0:7];        // 由8个计数器变量组成的数组
    reg bool[31:0];             // 由32个一位布尔寄存器变量组成的数组
    time chk_point[1:100];      // 由100个时间检查变量组成的数组
    reg[4:0] port_id[0:7];      // 由8个端口标识变量组成的数组, 端口变量的位宽为5
    integer matrix[4:0][0:255]; // 二维的整数型数组
    reg[63:0] array_4d[15:0][7:0][7:0][255:0];  // 四维64位寄存器型数组
    wire[7:0] w_array2[5:0];    // 声明8位向量的数组
    wire w_array1[7:0][5:0];    // 声明1位线型变量的二维数组
    
    initial
    begin
        count[5]=0;              // 把count数组中的第5个整数单元(32位)复位
        chk_point[100]=0;        // 把chk_point数组中的第100个时间型单元(64位)复位
        port_id[3]=0;            // 把port_id数组中的第3个寄存器单元(5位)复位
        
        matrix[1][0]=35559;      // 把数组中第1行第0列的整数型单元(32位)置为33559
        array_4d[0][0][0][0][15:0]=0;   // 把四维数组中的索引号位[0][0][0][0]的寄存器型单元的0~15位都置为0
        
        // 非法
        // port_id=0;            // 非法, 企图写整个数组
        // matrix[1]=0;          // 非法, 企图写整个第2行
    end
    
    // 存储器
    reg mem1bit[0:1023];        // 1K的一位存储器mem1bit
    reg[7:0] membyte[0:1023];   // 1K的字节(8位)存储器membyte
    initial
        membyte[511]=0;         // 取出存储器membyte中地址511处所存的字节
    
    // 参数
    parameter paraport_id=5;            // 定义常数port_id为5
    parameter cache_line_width=256;     // 定义高速缓冲器总线宽度为常数256
    parameter signed [15:0] WIDTH=0;    // 把参数WIDTH规定为有正负号,宽度为16位
    // 局部参数
    localparam  state1=4'b0001,
                state2=4'b0010,
                state3=4'b0100,
                state4=4'b1000;
    // 字符串
    reg [8*18:1] string_value;  // 声明变量string_value,其宽度为18个字节
    initial
        string_value="Hello Verilog World"; // 字符串可以存储在变量中
    
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
