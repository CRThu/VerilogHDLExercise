`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/24 23:37:54
// Design Name: 
// Module Name: beginEnd_forkJoin
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


module beginEnd_forkJoin;

// 顺序块
reg x,y;
reg [1:0] z,w;

initial
begin
    x = 1'b0;
    y = 1'b1;
    z = {x,y};
    w = {y,x};
end
// 带延迟的顺序块
initial
begin
    x = 1'b0;       // #0
    #5 y = 1'b1;    // #5
    #10 z = {x,y};  // #15
    #20 w = {y,x};  // #35 
end

// 并行块
// 带延迟的并行块
initial
fork
    x = 1'b0;       // #0
    #5 y = 1'b1;    // #5
    #10 z = {x,y};  // #10
    #20 w = {y,x};  // #20
join
// 故意引入竞争条件的并行块
initial
fork
    x = 1'b0;
    y = 1'b1;
    z = {x,y};  // 竞争
    w = {y,x};  // 竞争
join

// 嵌套块
initial
begin
    x = 1'b0;
    fork
        #5 y = 1'b1;
        #10 z = {x,y};
    join
    #20 w = {y,x};
end

// 命名块
initial
begin: block1   // 名字为block1的顺序命名块
    integer i;  // 整型变量i是block1命名块的静态本地变量
                // 可通过层次吗top.block1.i被其他模块访问
end

initial
fork: block2    // 名字为block2的并行命名块
    reg i;  // 寄存器变量i是block2命名块的静态变量
            // 可以通过层次名top.block2.i被其他模块访问
join

initial
begin: block3
    if(block1.i == 1)
        disable block3; // 可以禁用block3
end

endmodule
