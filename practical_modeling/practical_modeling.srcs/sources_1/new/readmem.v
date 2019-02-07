`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/07 18:33:50
// Design Name: 
// Module Name: readmem
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


module readmem;

reg [7:0] memory [0:7]; // 声明有8个8位的存储单元
integer i;

initial
begin
    // 把数据文件init.dat读入存储器中的给定地址
    // @<address> 数据文件指定地址(HEX)
    // 01xz01xz ... 数据(默认为x)
   $readmemb("init.dat",memory);
   for(i=0;i<8;i=i+1) 
        $display("Memory [%0d] = %b", i, memory[i]);    // 显示初始化后的存储器内容
end

endmodule
