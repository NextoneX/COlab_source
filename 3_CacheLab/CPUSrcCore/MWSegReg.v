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
    reg [31:0] StoreDataM;
    reg [3:0] MemWriteM;
    initial begin
        AluOutMW    = 0;
        RdMW        = 5'b0;
        PCMW        = 0;
        RegWriteMW  = 3'b0;
        MemWriteM   = 4'b0;
        StoreDataM  = 0;
        MemToRegMW  = 1'b0;
        LoadNpcMW   = 0;
    end
    
    always@(posedge clk)
        if(en) begin
            AluOutMW   <= clear ?     0 : AluOutE;
            RdMW       <= clear ?  5'b0 : RdE;
            PCMW       <= clear ?     0 : PCE;
            MemWriteM  <= clear ?  4'b0 : MemWriteE;
            StoreDataM <= clear ?     0 : ForwardData2;
            RegWriteMW <= clear ?  3'b0 : RegWriteE;
            MemToRegMW <= clear ?  1'b0 : MemToRegE;
            LoadNpcMW  <= clear ?     0 : LoadNpcE;
        end
        
    wire [31:0] RD_raw;
    cache #(
        .LINE_ADDR_LEN  ( 3             ),
        .SET_ADDR_LEN   ( 2             ),
        .TAG_ADDR_LEN   ( 7            ),
        .WAY_CNT        ( 3             )
    ) 
    cache_test_instance (
        .clk            ( clk           ),
        .rst            ( clear         ),
        .miss           ( Cachemiss    ),
        .addr           ( AluOutE      ),
        .rd_req         ( MemToRegE    ),
        .rd_data        ( RD_raw        ),
        .wr_req         ( |MemWriteE    ),
        .wr_data        ( ForwardData2    )
    );
        
    reg [31:0] hit_cnt = 0, miss_cnt = 0;
//    reg [31:0] last_addr = 0;
//    wire cache_rw = (|MemWriteM) | MemToRegMW;
//    always @ (posedge clk or posedge clear) begin
//        if(clear)
//            last_addr  <= 0;
//        else begin
//            if( cache_rw )
//                last_addr <= AluOutMW;
//        end
//    end
    wire cache_rw = (|MemWriteE) | MemToRegMW;
    always @ (posedge clk or posedge clear) begin
        if(clear) begin
            hit_cnt  <= 0;
            miss_cnt <= 0;
        end else begin
//            if( cache_rw & (last_addr!=AluOutMW) ) begin
            if( cache_rw ) begin
                if(Cachemiss)
                    miss_cnt <= miss_cnt+1;
                else
                    hit_cnt  <= hit_cnt +1;
            end
        end
    end
    

    // 增加清除和阻塞支??
    // 如果 chip not enabled, 输出上一次读到的
    // else 如果 chip clear, 输出 0
    // else 输出 values from bram
    reg stall_ff= 1'b0;
    reg clear_ff= 1'b0;
    reg [31:0] RD_old=32'b0;
    always @ (posedge clk)
    begin
        stall_ff<=~en;
        clear_ff<=clear;
//        RD_old<=RD_raw;
        RD_old<=RD;
    end    
    assign RD = stall_ff ? RD_old : (clear_ff ? 32'b0 : RD_raw );

endmodule

//功能说明
    //MWSegReg是第四段寄存??
    //类似于IDSegReg.V中对Bram的调用和拓展，它同时包含了一个同步读写的Bram
    //（此处你可以调用我们提供的举例：DataRam，它将会自动综合为block memory，你也可以替代???的调用xilinx的bram ip核）??
    //举例：DataRam DataRamInst (
    //    .clk    (),                      //请补??
    //    .wea    (),                      //请补??
    //    .addra  (),                      //请补??
    //    .dina   (),                      //请补??
    //    .douta  ( RD_raw         ),
    //    .web    ( WE2            ),
    //    .addrb  ( A2[31:2]       ),
    //    .dinb   ( WD2            ),
    //    .doutb  ( RD2            )
    //    );  

//实验要求  
    //实现MWSegReg模块

//注意事项
    //输入到DataRam的addra是字地址，一个字32bit
    //请配合DataExt模块实现非字对齐字节load
