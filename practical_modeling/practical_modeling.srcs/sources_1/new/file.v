`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/07 15:17:32
// Design Name: 
// Module Name: file
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


module file;

// 打开文件
// 多通道描述符
integer handle1,handle2,handle3;    // 整数型为32位

// 标准输出是打开的;    descriptor = 32'h0000_0001 (第0位置1) 
initial
begin
    handle1 = $fopen("file1.out");  // handle1 = 32'h0000_0002 (第1位置1)
    handle2 = $fopen("file2.out");  // handle2 = 32'h0000_0004 (第2位置1)
    handle3 = $fopen("file3.out");  // handle3 = 32'h0000_0008 (第3位置1)
end

// 写文件
integer desc1,desc2,desc3;  // 三个文件描述符
initial
begin
    desc1 = handle1 | 1; // 按位或, desc1 = 32'h0000_0003
    $fdisplay(desc1, "Display 1");  // 写文件到file1.out和标准输出stdout
    desc2 = handle2 | handle1;  //  desc2 = 32'h0000_0006
    $fdisplay(desc2, "Display 2");  // 写文件到file1.out和file2.out
    desc3 = handle3;            //  desc3 = 32'h0000_0008
    $fdisplay(desc3, "Display 3");  // 写文件到file3.out
end

// 关闭文件
initial
begin
    $fclose(handle1);
    $fclose(handle2);
    $fclose(handle3);
end

endmodule
