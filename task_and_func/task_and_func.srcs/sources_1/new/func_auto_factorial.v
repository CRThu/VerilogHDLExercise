`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/03 15:52:59
// Design Name: 
// Module Name: func_auto_factorial
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

// 用函数的递归调用定义阶乘运算
module func_auto_factorial;

// 定义自动(递归)函数
function automatic integer factorial;
input [31:0] oper;
integer i;
begin
    if(oper >= 2)
        factorial = factorial(oper-1) * oper;   // 递归调用
    else
        factorial = 1;
end
endfunction

// 调用该函数
integer result;
initial
begin
    result = factorial(4);  // 调用4的阶乘
    $display("Factorial of 4 is %0d", result); // 显示24
end

initial
    #5 $finish;

endmodule
