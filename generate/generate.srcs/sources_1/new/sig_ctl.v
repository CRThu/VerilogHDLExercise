`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/27 14:09:48
// Design Name: 
// Module Name: sig_ctl
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

`define TRUE  1'b1
`define FALSE 1'b0

// 延迟
`define Y2RDELAY 3  // 黄灯转红灯延迟
`define R2GDELAY 2  // 红灯转绿灯延迟

module sig_ctl(hwy, cntry, X, clock, clear);

// 输入/输出端口声明
output [1:0] hwy,cntry; // 表示三个状态的两位输出: G Y R
reg [1:0] hwy,cntry;    // 声明输出信号为寄存器类型

input X;                // 若为真(TRUE),表示有汽车通过乡村公路,否则为假(FALSE)
input clock,clear;

parameter  RED = 2'd0,  // 交通灯状态
            YELLOW = 2'd1,
            GREEN = 2'd2;

// 状态定义                 HWY     CNTRY
parameter  S0 = 3'd0,  // GREEN     RED
            S1 = 3'd1,  // YELLOW    RED
            S2 = 3'd2,  // RED       RED
            S3 = 3'd3,  // RED       GREEN
            S4 = 3'd4;  // RED       YELLOW

// 内部状态变量
reg [2:0] state,next_state;

// 状态只能在时钟信号的正跳变沿改变
always @(posedge clock)
    if(clear)
        state <= S0;    // 控制器状态从S0起始
    else
        state <= next_state;    // 状态的改变

// 计算主路信号和乡村公路信号的值
always @(state)
begin
    hwy = GREEN;    // 默认的主路信号灯颜色赋值
    cntry = RED;    // 默认的乡村公路信号灯颜色赋值
    case(state)
        S0: ;  // 没有改变,用默认值
        S1: hwy = YELLOW;
        S2: hwy = RED;
        S3: begin
                hwy = RED;
                cntry = GREEN;
            end
        S4: begin
                hwy = RED;
                cntry = YELLOW;
            end
    endcase
end

// 用case语句表述的状态机
always @(state or X)
begin
    case(state)
        S0: if(X)
                next_state = S1;
            else
                next_state = S0;
        S1: begin   // 延迟几个正跳变沿时钟
                repeat(`Y2RDELAY) @(posedge clock);
                next_state = S2;
            end
        S2: begin   // 延迟几个正跳变沿时钟
                repeat(`R2GDELAY) @(posedge clock);
                next_state = S3;
            end
        S3: if(X)
                next_state = S3;
            else
                next_state = S4;
        S4: begin   // 延迟几个正跳变沿时钟
                repeat(`Y2RDELAY) @(posedge clock);
                next_state = S0;
            end
        default: next_state = S0;
    endcase;
end

endmodule
