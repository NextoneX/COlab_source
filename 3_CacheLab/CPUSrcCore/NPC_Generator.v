`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design Name: RISCV-Pipline CPU
// Module Name: NPC_Generator
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: Choose Next PC value
//////////////////////////////////////////////////////////////////////////////////
module NPC_Generator(
    input wire [31:0] PCF,JalrTarget, BranchTarget, JalTarget,
    input wire BranchE,JalD,JalrE,
    output reg [31:0] PC_In
    );


    always@ (*) begin
        PC_In <= (BranchE == 1'b1)?(BranchTarget):
                    ((JalrE == 1'b1)?(JalrTarget):
                    ((JalD == 1'b1)?(JalTarget):
                    (PCF + 32'd4)));
    end  
endmodule  

//����˵��
    //NPC_Generator����������Next PCֵ��ģ�飬���ݲ�ͬ����ת�ź�ѡ��ͬ����PCֵ
//����
    //PCF              �ɵ�PCֵ
    //JalrTarget       jalrָ��Ķ�Ӧ����תĿ��
    //BranchTarget     branchָ��Ķ�Ӧ����תĿ��
    //JalTarget        jalָ��Ķ�Ӧ����תĿ��
    //BranchE==1       Ex�׶ε�Branchָ��ȷ����ת
    //JalD==1          ID�׶ε�Jalָ��ȷ����ת
    //JalrE==1         Ex�׶ε�Jalrָ��ȷ����ת
//���
    //PC_In            NPC��ֵ
//ʵ��Ҫ��  
    //ʵ��NPC_Generatorģ��  

