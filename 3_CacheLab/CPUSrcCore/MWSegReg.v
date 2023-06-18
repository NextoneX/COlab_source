`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design Name: RISCV-Pipline CPU
// Module Name: MEMSegReg
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: EX-MEM Segment Register
//////////////////////////////////////////////////////////////////////////////////
module MWSegReg(
    input wire clk,
    input wire rst,
    input wire en,
    input wire clear,
    //Data Signals
    input wire [31:0] AluOutE,
    output reg [31:0] AluOutMW, 
    input wire [31:0] ForwardData2,
    input wire [4:0] RdE,
    output reg [4:0] RdMW,
    input wire [31:0] PCE,
    output reg [31:0] PCMW,
    output wire [31:0] RD,
    //Data Memory Debug
    input wire [31:0] A2,
    input wire [31:0] WD2,
    input wire [3:0] WE2,
    output wire [31:0] RD2,
    //Control Signals
    input wire [3:0] MemWriteE,
    input wire [2:0] RegWriteE,
    output reg [2:0] RegWriteMW,
    input wire MemToRegE,
    output reg MemToRegMW,
    input wire LoadNpcE,
    output reg LoadNpcMW,
    output wire Cachemiss
    );
    initial begin
        AluOutMW    = 0;
        RdMW        = 5'b0;
        PCMW        = 0;
        RegWriteMW  = 3'b0;
        MemToRegMW  = 1'b0;
        LoadNpcMW   = 0;
    end
    
    always@(posedge clk)
        if(en) begin
            AluOutMW   <= clear ?     0 : AluOutE;
            RdMW       <= clear ?  5'b0 : RdE;
            PCMW       <= clear ?     0 : PCE;
            RegWriteMW <= clear ?  3'b0 : RegWriteE;
            MemToRegMW <= clear ?  1'b0 : MemToRegE;
            LoadNpcMW  <= clear ?     0 : LoadNpcE;
        end
        
    wire [31:0] RD_raw;
    cache #(
        .LINE_ADDR_LEN  ( 2             ),
        .SET_ADDR_LEN   ( 2             ),
        .TAG_ADDR_LEN   ( 9            ),
        .WAY_CNT        ( 3             )
    ) 
    cache_test_instance (
        .clk            ( clk           ),
        .rst            ( rst         ),
        .miss           ( Cachemiss    ),
        .addr           ( AluOutE      ),
        .rd_req         ( MemToRegE    ),
        .rd_data        ( RD_raw        ),
        .wr_req         ( |MemWriteE    ),
        .wr_data        ( ForwardData2    )
    );
        
    reg [31:0] hit_cnt = 0, miss_cnt = 0;
    wire cache_rw = (|MemWriteE) | MemToRegE;
    always @ (posedge clk) begin
        if(rst) begin
            hit_cnt  <= 0;
            miss_cnt <= 0;
        end else begin
            if( cache_rw ) begin
                if(Cachemiss)
                    miss_cnt <= miss_cnt+1;
                else
                    hit_cnt  <= hit_cnt +1;
            end
            else if(clear) begin
                hit_cnt  <= 0;
                miss_cnt <= 0;
            end
        end
    end
    

    // �������������֧??
    // ��� chip not enabled, �����һ�ζ�����
    // else ��� chip clear, ��� 0
    // else ��� values from bram
    reg stall_ff= 1'b0;
    reg clear_ff= 1'b0;
    reg [31:0] RD_old=32'b0;
    assign RD = stall_ff ? RD_old : (clear_ff ? 32'b0 : RD_raw );
    always @ (posedge clk)  
    begin
        stall_ff<=~en;
        clear_ff<=clear;
        RD_old<= RD;
    end    

endmodule

//����˵��
    //MWSegReg�ǵ��ĶμĴ�??
    //������IDSegReg.V�ж�Bram�ĵ��ú���չ����ͬʱ������һ��ͬ����д��Bram
    //���˴�����Ե��������ṩ�ľ�����DataRam���������Զ��ۺ�Ϊblock memory����Ҳ�������???�ĵ���xilinx��bram ip�ˣ�??
    //������DataRam DataRamInst (
    //    .clk    (),                      //�벹??
    //    .wea    (),                      //�벹??
    //    .addra  (),                      //�벹??
    //    .dina   (),                      //�벹??
    //    .douta  ( RD_raw         ),
    //    .web    ( WE2            ),
    //    .addrb  ( A2[31:2]       ),
    //    .dinb   ( WD2            ),
    //    .doutb  ( RD2            )
    //    );  

//ʵ��Ҫ��  
    //ʵ��MWSegRegģ��

//ע������
    //���뵽DataRam��addra���ֵ�ַ��һ����32bit
    //�����DataExtģ��ʵ�ַ��ֶ����ֽ�load
