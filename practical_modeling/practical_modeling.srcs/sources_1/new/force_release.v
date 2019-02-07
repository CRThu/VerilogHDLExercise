`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/03 18:09:43
// Design Name: 
// Module Name: force_release
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


module force_release;

reg D,CLK,RESET;
wire Q,QBar;

// 调用(实例引用)该D触发器
assign_deassign d1(Q,QBar,D,CLK,RESET);

always
    #10 CLK = ~CLK;

always
    #25 D = ~D;
        
initial
begin
    D=1; CLK=0; RESET=0;
    #150 RESET=1;
    #50 RESET=0;
    #200 $finish;
end

// 作用于寄存器上的force和release
initial
begin
    // 下面这两条语句在时间单位50到100之间给dff.q强制赋值1
    // 不考虑edge_dff触发器的实际输出
    #50 force assign_deassign.q = 1'b1;
    #100 release assign_deassign.q;
end

// 作用于线网上的force和release
reg a=1, b=0, c=1;
wire out;
assign out = a & b & c;

initial
begin
    #50 force out = a | b & c;
    #50 release out;
end

endmodule
