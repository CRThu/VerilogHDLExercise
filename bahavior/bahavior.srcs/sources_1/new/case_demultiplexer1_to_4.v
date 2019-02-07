`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/24 13:40:45
// Design Name: 
// Module Name: case_demultiplexer1_to_4
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


module case_demultiplexer1_to_4(output reg out0,out1,out2,out3, input in, s1,s0);

always @(s1 or s0 or in)
    case ({s1, s0})
        2'b00 : begin out0 = in; out1 = 1'bz; out2 = 1'bz; out3 = 1'bz; end
        2'b01 : begin out0 = 1'bz; out1 = in; out2 = 1'bz; out3 = 1'bz; end
        2'b10 : begin out0 = 1'bz; out1 = 1'bz; out2 = in; out3 = 1'bz; end
        2'b11 : begin out0 = 1'bz; out1 = 1'bz; out2 = 1'bz; out3 = in; end
        // 考虑选择信号有不确定值x,若x则输出x,若z则输出z,若xz则输出x
        2'bx0, 2'bx1, 2'bxz, 2'bxx, 2'b0x, 2'b1x, 2'bzx :
            begin
                out0 = 1'bx; out1 = 1'bx; out2 = 1'bx; out3 = 1'bx;
            end
        2'bz0, 2'bz1, 2'bzz, 2'b0z, 2'b1z :
            begin
                out0 = 1'bz; out1 = 1'bz; out2 = 1'bz; out3 = 1'bz;
            end
        default : $display("Unspecified control signals");
    endcase

endmodule
