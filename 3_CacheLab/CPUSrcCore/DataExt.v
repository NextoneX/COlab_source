`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design Name: 
// Module Name: DataExt 
// Target Devices: 
// Tool Versions: 
// Description: 
//////////////////////////////////////////////////////////////////////////////////

`include "Parameters.v"   
module DataExt(
    input wire [31:0] IN,
    input wire [1:0] LoadedBytesSelect,
    input wire [2:0] RegWriteMW,
    output reg [31:0] OUT
    );
    
    wire [31:0] tar_byte;
    //?
    assign tar_byte = IN >> (LoadedBytesSelect * 8);
    always @(*) begin
        case (RegWriteMW)
           `LB:     OUT <= {{24{tar_byte[7]}}, tar_byte[7:0]};
           `LH:     OUT <= {{16{tar_byte[15]}}, tar_byte[15:0]};
           `LW:     OUT <= IN;
           `LBU:    OUT <= {24'b0, tar_byte[7:0]};
           `LHU:    OUT <= {16'b0, tar_byte[15:0]};
           default: OUT <= 32'b0;                          
        endcase
    end
    
    
endmodule

//����˵��
    //DataExt������������ֶ���load�����Σ�ͬʱ����load�Ĳ�ͬģʽ��Data Mem��load�������з��Ż����޷�����չ������߼���·
//����
    //IN                    �Ǵ�Data Memory��load��32bit��
    //LoadedBytesSelect     �ȼ���AluOutMW[1:0]���Ƕ�Data Memory��ַ�ĵ���λ��
                            //��ΪDataMemory�ǰ��֣�32bit�����з��ʵģ�������Ҫ���ֽڵ�ַת��Ϊ�ֵ�ַ����DataMem
                            //DataMemһ�η���һ���֣�����λ��ַ������32bit������ѡ��������Ҫ���ֽ�
    //RegWriteMW             ��ʾ��ͬ�� �Ĵ���д��ģʽ ������ģʽ������Parameters.v��
//���
    //OUT��ʾҪд��Ĵ���������ֵ
//ʵ��Ҫ��  
    //ʵ��DataExtģ��  