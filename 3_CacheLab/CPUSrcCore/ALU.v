`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design Name: RISCV CPU
// Module Name: ALU
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: ALU unit of RISCV CPU
//////////////////////////////////////////////////////////////////////////////////
`include "Parameters.v"   
module ALU(
    input wire [31:0] Operand1,
    input wire [31:0] Operand2,
    input wire [3:0] AluContrl,
    output reg [31:0] AluOut
    );
    
    //ALU no need to modify, copy from lab1
    
    always @(*) begin
        case (AluContrl)
            `SLL:       AluOut <= Operand1 << Operand2[4:0];
            `SRL:       AluOut <= Operand1 >> Operand2[4:0];
            `SRA:       AluOut <= $signed(Operand1) >>> Operand2[4:0];
            `ADD:       AluOut <= Operand1 + Operand2;
            `SUB:       AluOut <= Operand1 - Operand2;
            `XOR:       AluOut <= Operand1 ^ Operand2;
            `OR:        AluOut <= Operand1 | Operand2;
            `AND:       AluOut <= Operand1 & Operand2;
            `SLT:       AluOut <= ($signed(Operand1) < $signed(Operand2)) ? 32'b1 : 32'b0;
            `SLTU:      AluOut <= (Operand1 < Operand2) ? 32'b1 : 32'b0;
            `LUI:       AluOut <= Operand2;
            default:    AluOut <= 32'hxxxxxxxx;                          
        endcase
    end
endmodule

//���ܺͽӿ�˵��
	//ALU��������������������AluContrl�Ĳ�ͬ�����в�ͬ�ļ���������������������AluOut
	//AluContrl�����Ͷ�����Parameters.v��
//�Ƽ���ʽ��
    //case()
    //    `ADD:        AluOut<=Operand1 + Operand2; 
    //   	.......
    //    default:    AluOut <= 32'hxxxxxxxx;                          
    //endcase
//ʵ��Ҫ��  
    //ʵ��ALUģ��