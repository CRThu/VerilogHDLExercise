`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/20 00:22:00
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

// 编写无端口激励模块
module testbench;

// 声明连接到输入端口的变量
reg in0,in1,in2,in3;
reg s1,s0;

// 声明输出连线
wire out1,out2,out3;

// 调用(实例引用)多路器

mux4_to_1 mymux1(out1, in0,in1,in2,in3, s1,s0);
logic1_mux4_to_1 mymux2(out2, in0,in1,in2,in3, s1,s0);
logic1_mux4_to_1 mymux3(out3, in0,in1,in2,in3, s1,s0);

// 产生输入激励信号
// Define the stimulus module (no ports)

initial
begin
    $monitor("s1 = %b, s0 = %b, out = %b.", s1, s0, out1);
    
    in0=1; in1=0; in2=1; in3=0;
    #0 s1=0; s0=0;      // 选择 in0
    #1 s1=0; s0=1;      // 选择 in1
    #1 s1=1; s0=0;      // 选择 in2
    #1 s1=1; s0=1;      // 选择 in3
    #1 $finish;
    
end

endmodule
