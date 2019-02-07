`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/30 20:32:27
// Design Name: 
// Module Name: task_sequence
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

// 定义包含名为asymmetric_sequence的任务的模块
module task_sequence;

reg clock;

initial
    init_sequence;  // 启动init_sequence任务

always
    asymmetric_sequence;    // 启动asymmetric_sequence任务

// 定义名为init_sequence(初始化序列)的任务
task init_sequence;
begin
    clock = 1'b0;
end
endtask

// 定义能产生非对称序列的任务
// 直接根据模块中定义的序列来操作时钟(clock)信号
task asymmetric_sequence;
begin
    #12 clock = 1'b0;
    #5 clock = 1'b1;
    #3 clock = 1'b0;
    #10 clock = 1'b1;
end
endtask

endmodule
