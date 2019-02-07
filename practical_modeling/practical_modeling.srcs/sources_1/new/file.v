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

// ���ļ�
// ��ͨ��������
integer handle1,handle2,handle3;    // ������Ϊ32λ

// ��׼����Ǵ򿪵�;    descriptor = 32'h0000_0001 (��0λ��1) 
initial
begin
    handle1 = $fopen("file1.out");  // handle1 = 32'h0000_0002 (��1λ��1)
    handle2 = $fopen("file2.out");  // handle2 = 32'h0000_0004 (��2λ��1)
    handle3 = $fopen("file3.out");  // handle3 = 32'h0000_0008 (��3λ��1)
end

// д�ļ�
integer desc1,desc2,desc3;  // �����ļ�������
initial
begin
    desc1 = handle1 | 1; // ��λ��, desc1 = 32'h0000_0003
    $fdisplay(desc1, "Display 1");  // д�ļ���file1.out�ͱ�׼���stdout
    desc2 = handle2 | handle1;  //  desc2 = 32'h0000_0006
    $fdisplay(desc2, "Display 2");  // д�ļ���file1.out��file2.out
    desc3 = handle3;            //  desc3 = 32'h0000_0008
    $fdisplay(desc3, "Display 3");  // д�ļ���file3.out
end

// �ر��ļ�
initial
begin
    $fclose(handle1);
    $fclose(handle2);
    $fclose(handle3);
end

endmodule
