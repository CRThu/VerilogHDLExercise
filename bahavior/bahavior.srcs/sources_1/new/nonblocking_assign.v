`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/23 14:37:32
// Design Name: 
// Module Name: nonblocking_assign
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


module nonblocking_assign;

reg x,y,z;
reg [15:0] reg_a,reg_b;
integer count;

// 所有行为语句必须放在initial或always块内部
initial
begin
    x = 0; y = 1; z = 1;  // 标量赋值
    count = 0;    // 整形变量赋值
    reg_a = 16'b0;  reg_b = reg_a;  // 向量的初始化
    
    reg_a[2] <= #15 1'b1; // 带延迟的位选赋值
    reg_b[15:13] <= #10 {x, y, z};  // 把拼接操作的结果赋值给向量的部分位(域)
    
    count <= count + 1; // 给整形变量赋值(递增)
    
    #20 $finish;
end
endmodule
