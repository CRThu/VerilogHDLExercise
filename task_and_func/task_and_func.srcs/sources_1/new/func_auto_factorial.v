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

// �ú����ĵݹ���ö���׳�����
module func_auto_factorial;

// �����Զ�(�ݹ�)����
function automatic integer factorial;
input [31:0] oper;
integer i;
begin
    if(oper >= 2)
        factorial = factorial(oper-1) * oper;   // �ݹ����
    else
        factorial = 1;
end
endfunction

// ���øú���
integer result;
initial
begin
    result = factorial(4);  // ����4�Ľ׳�
    $display("Factorial of 4 is %0d", result); // ��ʾ24
end

initial
    #5 $finish;

endmodule
