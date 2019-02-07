`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/26 17:51:52
// Design Name: 
// Module Name: multiplier
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

// 本模块实现一个参数化乘法器
module genif_multiplier(product, a0, a1);
// 参数声明,该参数可以重新定义
parameter a0_width = 8; // 8-bit bus by default
parameter a1_width = 8; // 8-bit bus by default

// 本地参数声明
// 本地参数不能用参数重新定义(defparam)修改
// 也不能在实例引用时通过传递参数语句,即 #(参数1,参数2,...)的方法修改
localparam product_width = a0_width + a1_width;

// 端口声明语句
output [product_width-1:0] product;
input [a0_width-1:0] a0;
input [a1_width-1:0] a1;

// 有条件的调用(实例引用)不同类型的乘法器
// 根据参数a0_width和a1_width的值.在调用时引用相对应的乘法器实例
generate
    if(a0_width < 8 || a1_width < 8)
        cla_multiplier #(a0_width, a1_width) m0 (product, a0, a1);
    else
        tree_multiplier #(a0_width, a1_width) m0 (product, a0, a1);
endgenerate

endmodule
