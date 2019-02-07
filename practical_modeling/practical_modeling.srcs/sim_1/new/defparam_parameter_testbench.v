`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/04 14:41:34
// Design Name: 
// Module Name: defparam_parameter_testbench
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


module defparam_parameter_testbench;

// 用defparam语句,改变引用的实例模块中的参数值
defparam w1.id_num = 1, w2.id_num = 2;

// 调用模块
defparam_parameter #(4, 5, 6) w1();
defparam_parameter #(9, 4) w2();
defparam_parameter #(.delay2(4), .delay3(8)) w3();

endmodule
