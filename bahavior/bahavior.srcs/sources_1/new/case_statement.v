`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/23 19:49:07
// Design Name: 
// Module Name: case_statement
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


module case_statement;

// ��·��֧���
reg [1:0] alu_control;
reg x,y,z;

initial
begin
    case (alu_control)
        2'd0 : y = x + z;
        2'd1 : y = x - z;
        2'd2 : y = x * z;
        default : $display("Invalid ALU control signal");
    endcase
end

// casex��casez�ؼ���
reg [3:0] encoding;
integer next_state;
initial
begin
    casex (encoding)    // �߼�ֵx��ʾ�޹�λ
        4'b1xxx : next_state = 3;
        4'b1xxx : next_state = 2;
        4'b1xxx : next_state = 1;
        4'b1xxx : next_state = 0;
        default : next_state = 0;
    endcase
end

endmodule
