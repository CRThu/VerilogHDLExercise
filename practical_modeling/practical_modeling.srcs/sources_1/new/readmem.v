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

reg [7:0] memory [0:7]; // ������8��8λ�Ĵ洢��Ԫ
integer i;

initial
begin
    // �������ļ�init.dat����洢���еĸ�����ַ
    // @<address> �����ļ�ָ����ַ(HEX)
    // 01xz01xz ... ����(Ĭ��Ϊx)
   $readmemb("init.dat",memory);
   for(i=0;i<8;i=i+1) 
        $display("Memory [%0d] = %b", i, memory[i]);    // ��ʾ��ʼ����Ĵ洢������
end

endmodule
