`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/01 15:39:30
// Design Name: 
// Module Name: func_parity
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

// 定义一个模块,其中包含能计算偶校验位的函数calc_parity
module func_parity;

reg [31:0] addr;
reg parity;

// 每当地址值发生变化,计算新的偶校验位
always @(addr)
begin
    parity = calc_parity(addr);     // 第一次启动校验位计算函数calc_parity
    $display("Parity calculated = %b", calc_parity(addr));  // 第二次启动校验位计算函数calc_parity
end

// 定义偶校验位计算函数
function calc_parity(input [31:0] address);
/*
function calc_parity;
input [31:0] address;
*/
begin
    // 适当的设置输出值,使用隐含的内部寄存器calc_parity
    calc_parity = ^address; // 返回所以地址位的异或值
end
endfunction

initial
    addr = 0;

always
    #10 addr = addr + 1;
    
initial
    #100 $finish;

endmodule
