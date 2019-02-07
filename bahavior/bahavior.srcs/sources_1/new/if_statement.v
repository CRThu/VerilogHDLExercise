`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/23 19:22:35
// Design Name: 
// Module Name: if_statement
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

// 条件语句
module if_statement;

parameter MAX_Q_DEPTH = 16;
reg lock,enable;
reg buffer,data,out,in;
reg data_quene,number_quened;
reg alu_control,x,y,z;

initial
begin
    // 第一类条件语句
    if(!lock)
        buffer = data;
    if(enable)
        out = in;
        
    // 第二类条件语句
    if(number_quened < MAX_Q_DEPTH)
    begin
        data_quene = data;
        number_quened = number_quened + 1;
    end
    else
        $display("Quene Full.Try again");

    // 第三类条件语句
    // 根据不同的算术逻辑单元的控制信号alu_control执行不同的算术运算操作
    if(alu_control == 0)
        y = x + z;
    else if(alu_control == 1)
        y = x - z;
    else if(alu_control == 2)
        y = x * z;
    else
        $display("Invalid ALU control signal");
end

endmodule
