`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design Name: RISCV-Pipline CPU
// Module Name: ControlUnit
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: RISC-V Instruction Decoder
//////////////////////////////////////////////////////////////////////////////////
`include "Parameters.v"   
`define ControlOut {{JalD,JalrD},{MemToRegD},{RegWriteD},{MemWriteD},{LoadNpcD},{RegReadD},{BranchTypeD},{AluContrlD},{AluSrc1D,AluSrc2D},{ImmType}}
module ControlUnit(
    input wire [6:0] Op,
    input wire [2:0] Fn3,
    input wire [6:0] Fn7,
    output reg JalD,
    output reg JalrD,
    output reg [2:0] RegWriteD,
    output reg MemToRegD,
    output reg [3:0] MemWriteD,
    output reg LoadNpcD,
    output reg [1:0] RegReadD,
    output reg [2:0] BranchTypeD,
    output reg [3:0] AluContrlD,
    output reg [1:0] AluSrc2D,
    output reg AluSrc1D,
    output reg [2:0] ImmType        
    );
    
    //J-type jal,jalr,loadnpc
    always @(*) begin
        case (Op)
            7'b1101111:  begin
                JalD <= 1'b1;
                JalrD <= 1'b0;  
                LoadNpcD <= 1'b1;    
            end
            7'b1100111:  begin
                JalD <= 1'b0;
                JalrD <= 1'b1;  
                LoadNpcD <= 1'b1;    
            end
            default:  begin
                JalD <= 1'b0;
                JalrD <= 1'b0;  
                LoadNpcD <= 1'b0;    
            end                          
        endcase
    end
    
    //RegWrite
    always @(*) begin
        case (Op) 
            7'b0110011, 7'b0010011, 7'b0110111, 7'b0010111, 7'b1101111, 7'b1100111:
                RegWriteD <= `LW;
            7'b0100011, 7'b1100011:     
                RegWriteD <= `NOREGWRITE; 
            7'b0000011: begin
                case(Fn3)
                    3'b000:     RegWriteD <= `LB;
                    3'b001:     RegWriteD <= `LH;
                    3'b010:     RegWriteD <= `LW;
                    3'b100:     RegWriteD <= `LBU;
                    3'b101:     RegWriteD <= `LHU;
                    default:    RegWriteD <= `NOREGWRITE;
                endcase    
            end   
            default:    RegWriteD <= `NOREGWRITE;             
        endcase
    end
    
    //MemToReg
    always @(*) begin
        if (Op == 7'b0000011)  
            MemToRegD <= 1'b1;
        else
            MemToRegD <= 1'b0;
    end
    
    //MemWrite
    always @(*) begin
        if (Op == 7'b0100011) begin
            case(Fn3)
                3'b000:     MemWriteD <= 4'b0001;
                3'b001:     MemWriteD <= 4'b0011;
                3'b010:     MemWriteD <= 4'b1111;
                default:    MemWriteD <= 4'b0000;
            endcase                     
        end
        else 
            MemWriteD <= 4'b0000;
    end
    
    //RegRead
    always @(*) begin
        case (Op)
            7'b0110011:     RegReadD <= 2'b11;
            7'b0010011:     RegReadD <= 2'b10;
            7'b0110111:     RegReadD <= 2'b00; 
            7'b0010111:     RegReadD <= 2'b00;
            7'b0000011:     RegReadD <= 2'b10;
            7'b0100011:     RegReadD <= 2'b11;
            7'b1100011:     RegReadD <= 2'b11; 
            7'b1101111:     RegReadD <= 2'b00; 
            7'b1100111:     RegReadD <= 2'b10;              
        endcase
    end
    
    //BranchType
    always @(*) begin
        if (Op == 7'b1100011)begin
            case (Fn3)
                3'b000:     BranchTypeD <= `BEQ;
                3'b001:     BranchTypeD <= `BNE;
                3'b100:     BranchTypeD <= `BLT;
                3'b101:     BranchTypeD <= `BGE;
                3'b110:     BranchTypeD <= `BLTU;
                3'b111:     BranchTypeD <= `BGEU;
                default:    BranchTypeD <= `NOBRANCH;                          
            endcase
        end
        else 
             BranchTypeD <= `NOBRANCH;
    end
    
    //AluContrl
    always @(*) begin
        if ((Op == 7'b0010011) || (Op == 7'b0110011))begin
            case (Fn3)
                3'b000:     AluContrlD <= ((Op == 7'b0110011) && (Fn7 == 7'b0100000)) ? `SUB : `ADD;
                3'b001:     AluContrlD <= `SLL;
                3'b010:     AluContrlD <= `SLT;
                3'b011:     AluContrlD <= `SLTU;
                3'b100:     AluContrlD <= `XOR;
                3'b101:     AluContrlD <= (Fn7 == 7'b0100000) ? `SRA : `SRL;
                3'b110:     AluContrlD <= `OR;
                3'b111:     AluContrlD <= `AND;
                default:    AluContrlD <= 4'hx;                          
            endcase
        end
        else if(Op == 7'b0110111)
            AluContrlD <= `LUI;
        else
            AluContrlD <= `ADD;
    end      
    
    //AluSrc1
    always@(*) begin
        case(Op)
            7'b0110011:     AluSrc1D <= 1'b0;
            7'b0010011:     AluSrc1D <= 1'b0;
            7'b0110111:     AluSrc1D <= 1'b0;
            7'b0010111:     AluSrc1D <= 1'b1;
            7'b0000011:     AluSrc1D <= 1'b0;
            7'b0100011:     AluSrc1D <= 1'b0;
            7'b1100011:     AluSrc1D <= 1'b0;
            7'b1101111:     AluSrc1D <= 1'b0;
            7'b1100111:     AluSrc1D <= 1'b0;
        endcase
    end    
    
    //AluSrc2
    always@(*) begin
        case(Op)
            7'b0110011:     AluSrc2D <= 2'b00;
            7'b0010011:     AluSrc2D <= (Fn3 == 3'b101 || Fn3 == 3'b001)? 2'b01 : 2'b10;
            7'b0110111:     AluSrc2D <= 2'b10;
            7'b0010111:     AluSrc2D <= 2'b10;
            7'b0000011:     AluSrc2D <= 2'b10;
            7'b0100011:     AluSrc2D <= 2'b10;
            7'b1100011:     AluSrc2D <= 2'b00;
            7'b1101111:     AluSrc2D <= 2'b00;
            7'b1100111:     AluSrc2D <= 2'b10;
        endcase
    end    
    
    //ImmType
    always @(*) begin
        case (Op)
            7'b0110011:     ImmType <= `RTYPE;
            7'b0010011:     ImmType <= `ITYPE;
            7'b0110111:     ImmType <= `UTYPE; 
            7'b0010111:     ImmType <= `UTYPE;
            7'b0000011:     ImmType <= `ITYPE;
            7'b0100011:     ImmType <= `STYPE;
            7'b1100011:     ImmType <= `BTYPE;
            7'b1101111:     ImmType <= `JTYPE;
            7'b1100111:     ImmType <= `ITYPE;             
        endcase
    end
endmodule

//����˵��
    //ControlUnit       �Ǳ�CPU��ָ��������������߼���·
//����
    // Op               ��ָ��Ĳ����벿��
    // Fn3              ��ָ���func3����
    // Fn7              ��ָ���func7����
//���
    // JalD==1          ��ʾJalָ���ID����׶�
    // JalrD==1         ��ʾJalrָ���ID����׶�
    // RegWriteD        ��ʾID�׶ε�ָ���Ӧ�� �Ĵ���д��ģʽ ������ģʽ������Parameters.v��
    // MemToRegD==1     ��ʾID�׶ε�ָ����Ҫ��data memory��ȡ��ֵд��Ĵ���,
    // MemWriteD        ��4bit�����ö������ʽ������data memory��32bit�ְ�byte����д��,MemWriteD=0001��ʾֻд�����1��byte����xilinx bram�Ľӿ�����
    // LoadNpcD==1      ��ʾ��NextPC�����ResultM
    // RegReadD[1]==1   ��ʾA1��Ӧ�ļĴ���ֵ��ʹ�õ��ˣ�RegReadD[0]==1��ʾA2��Ӧ�ļĴ���ֵ��ʹ�õ��ˣ�����forward�Ĵ���
    // BranchTypeD      ��ʾ��ͬ�ķ�֧���ͣ��������Ͷ�����Parameters.v��
    // AluContrlD       ��ʾ��ͬ��ALU���㹦�ܣ��������Ͷ�����Parameters.v��
    // AluSrc2D         ��ʾAlu����Դ2��ѡ��
    // AluSrc1D         ��ʾAlu����Դ1��ѡ��
    // ImmType          ��ʾָ�����������ʽ���������Ͷ�����Parameters.v��   
//ʵ��Ҫ��  
    //ʵ��ControlUnitģ��   