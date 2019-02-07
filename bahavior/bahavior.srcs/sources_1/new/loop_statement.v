`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/24 14:16:58
// Design Name: 
// Module Name: loop_statement
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


module loop_statement;

// while循环
// 计数器变量count从0增加到127并显示count变量
integer count;
initial
begin
    count = 0;
    while (count < 128)
    begin
        $display("Count = %d", count);
        count = count + 1;
    end
end

// 在标志向量flag中(从最低位起)寻找第一个值为1的位
`define TRUE 1'b1
`define FALSE 1'b0
reg [15:0] flag;
integer i;  // 整形数用于计数
reg continue;

initial
begin
    flag = 16'b0010_0000_0000_0000;
    i = 0;
    continue = `TRUE;
    
    while((i<16) && continue)   // 用操作符的多个条件构成while表达式
    begin
        if(flag[i])
        begin
            $display("Encounterd a TURE bit at element number %d",i);
            continue = `FALSE;
        end
         i = i +1;
    end
end

// for循环
integer count2;
initial
begin
    for(count2=0 ; count2<128 ; count2=count2+1)
        $display("Count2 = %d",count2);
end

// 数组元素的初始化
`define MAX_STATES 32
integer state [0:`MAX_STATES-1]; // 整形数数组state共有元素state[0]至state[31] 

initial
begin
    for(i=0 ; i<32 ; i=i+2) // 把所有偶元素初始化为0
        state[i] = 0;
    for(i=1 ; i<32 ; i=i+2) // 把所有偶元素初始化为1
        state[i] = 1;
end

// repeat循环
// 从0增加到127计数并显示
integer count3;
initial
begin
    count3 = 0;
    repeat(128)
    begin
        $display("Count3 = %d", count3);
        count3 = count3 + 1;
    end
end

// 数据缓冲模块举例
// 收到data_start信号后, 其后8个时钟周期读入数据
// module data_buffer(data_start, data, clock);
parameter cycles = 8;

reg data_start = 1;
reg [15:0] data;
reg clock;
reg [15:0] buffer [0:7];

always @(posedge clock)
begin
    if(data_start)  // data_start信号为真
    begin
        i = 0;
        repeat(cycles)  // 在接下来的8个时钟周期的正跳变沿存储数据
        begin
            @(posedge clock)buffer[i] = data;   // 等待下一个正跳变沿的到来锁存数据
            i = i + 1;
        end
    end
end

// forever循环
// 用forever循环, 不用always块
initial
begin
    clock = 1'b0;
    forever #10 clock = ~clock; // 时钟周期为20个单位时间
end

// 在每个时钟正跳变沿出修改数据
initial
begin
    data = 16'b1111_0111_0011_0001;
    forever @(posedge clock) data = data >> 2;
end

endmodule
