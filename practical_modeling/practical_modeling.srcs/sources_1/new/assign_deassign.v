`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/03 17:30:11
// Design Name: 
// Module Name: assign_deassign
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

// 具有异步复位段,由下降沿触发的D触发器
module assign_deassign(q, qbar, d, clk, reset);

// 输入和输出
output q,qbar;
input d,clk,reset;
reg q, qbar;    // 把q, qbar声明为寄存器

always @(negedge clk)   //在有效的时钟沿为q和qbar赋值
begin
    q = d;
    qbar = ~d;
end

always @(reset) // 当reset跳变为高电平时,使用过程连续赋值语句, 改写(覆盖)常规赋值语句对q和qbar的赋值
    if(reset)
    begin   // 如果reset为高电平,用过程连续赋值语句中的新值, 改写(覆盖)常规赋值语句对q的赋值
       assign q = 1'b0;
       assign qbar = 1'b1;
    end
    else
    begin   // 如果reset跳变为低电平,通过dessign语句取消对q和qbar值的覆盖
            // 常规赋值语句q = d和qbar = ~d将能够在下一个时钟下降沿时刻改变寄存器的值
        deassign q;
        deassign qbar;
    end

endmodule
