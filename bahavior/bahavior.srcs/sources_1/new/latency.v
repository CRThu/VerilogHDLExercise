`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/23 15:52:22
// Design Name: 
// Module Name: latency
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


module latency;
// 定义参数
parameter latency = 20;
parameter delta = 2;
// 定义寄存器变量
reg x,y,z,p,q;

initial
begin
    x = 0;  // 没有延迟控制
    #10 y = 1;  // 延迟值时数字的延迟控制,#10后执行y=1
    
    #latency z = 0; // 使用标识符的延迟控制,延迟#20
    #(latency + delta) p = 1; // 使用表达式控制的延迟
    
    #y x = x + 1;   // 使用标识符的延迟控制, 用y的值
    
    #(4:5:6) q = 0; // 最小/典型/最大延迟值
end

// 内嵌赋值延迟
initial
begin
    x = 0; z = 0;
    y = #5 x + z;   // 在仿真的0时刻取得x和z的值,计算x + z
                    // #5后赋值给y
end
// 用临时变量和正规的延迟控制, 达到同样的效果
reg temp_xz;
initial
begin
    x = 0; z = 0;
    temp_xz = x + z;    // 在当前时刻计算x + z的值, 把计算结果存储在临时变量中
    #5 y = temp_xz;     // #5时, 赋值给y,期间时刻x和z变化不影响y值
end

// 零延迟控制
initial
begin
    x = 0;
    y = 0;
end
// 保证零延迟控制在最后执行
// 不保证多个零延迟语句先后顺序
initial
begin
    #0 x = 1;   // 零延迟控制
    #0 y = 1;
end

endmodule
