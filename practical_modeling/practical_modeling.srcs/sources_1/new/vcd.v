`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/07 20:24:02
// Design Name: 
// Module Name: vcd
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


module vcd;
// 指定VCD文件名,若不指定VCD文件,则由仿真器指定一个默认文件名
initial
    $dumpfile("myfile.dmp");    // 仿真信息转储到myfile.dmp文件

// 转储模块中的信号
initial
    $dumpvars;  // 没有指定变量范围, 把设计中的全部信号都转储
initial
    $dumpvars(1,top);   // 转储模块实例top中的信号
                        // 1表示层次等级,值转储top下的第一层信号,即top模块中的变量,而不转储top中调用的模块的变量
initial
    $dumpvars(2,top.m1);    // 转储top.m1模块以下两层的信号
initial
    $dumpvars(0,top.m1);    // 数0表示转储top.m1模块下面各个层的所有信号

// 启动和停止转储过程
initial
begin
    $dumpon;        // 启动转储过程
    #1000 $dumpoff; // 停止转储过程
end

// 生成一个检查点,转储所有VCD变量的当前值
initial
    $dumpall;


endmodule
