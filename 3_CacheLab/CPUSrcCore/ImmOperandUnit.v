`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design Name: RISCV-Pipline CPU
// Module Name: ImmOperandUnit
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: Generate different type of Immediate Operand
//////////////////////////////////////////////////////////////////////////////////
`include "Parameters.v"   
module ImmOperandUnit(
    input wire [31:7] In,
    input wire [2:0] Type,
    output reg [31:0] Out
    );
    
    always@(*)begin
        case(Type)
            `ITYPE:     Out <= { {21{In[31]}}, In[30:20] };
            `STYPE:     Out <= { {21{In[31]}}, In[30:25], In[11:7]};
            `BTYPE:     Out <= { {20{In[31]}}, In[7], In[30:25], In[11:8], 1'b0};
            `UTYPE:     Out <= { In[31:12], 12'b0};
            `JTYPE:     Out <= { {12{In[31]}}, In[19:12], In[20], In[30:21], 1'b0};
            default:    Out <= 32'hxxxxxxxx;
        endcase
    end
    
endmodule

//����˵��
    //ImmOperandUnit�������ڱ������ָ��Ĳ��ֱ���ֵ�����ɲ�ͬ���͵�32bit������
//����
    //IN        ��ָ�����opcode����Ĳ��ֱ���ֵ
    //Type      ��ʾ�������������ͣ�ȫ�����Ͷ�����Parameters.v��
//���
    //OUT       ��ʾָ���Ӧ��������32bitʵ��ֵ
//ʵ��Ҫ��  
    //��ȫImmOperandUnitģ��  
    //����ȫ��������

    //always@(*)
    //begin
    //    case(Type)
    //        `ITYPE: Out<={ {21{In[31]}}, In[30:20] };
    //        //......                                        //�벹ȫ!!!
    //        default:Out<=32'hxxxxxxxx;
    //    endcase
    //end