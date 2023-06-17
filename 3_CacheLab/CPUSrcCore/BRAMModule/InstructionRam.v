`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design Name: RISCV-Pipline CPU
// Module Name: InstructionRamWrapper
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: a Verilog-based ram which can be systhesis as BRAM
// 
//////////////////////////////////////////////////////////////////////////////////
module InstructionRam(
    input  clk,
    input  web,
    input  [31:2] addra, addrb,
    input  [31:0] dinb,
    output reg [31:0] douta, doutb
);
initial begin douta=0; doutb=0; end

wire addra_valid = ( addra[31:14]==18'h0 );
wire addrb_valid = ( addrb[31:14]==18'h0 );
wire [11:0] addral = addra[13:2];
wire [11:0] addrbl = addrb[13:2];

reg [31:0] ram_cell [0:4095];
//Quicksort.S
initial begin
    ram_cell[       0] = 32'h10004693;
    ram_cell[       1] = 32'h00001137;
    ram_cell[       2] = 32'h00004533;
    ram_cell[       3] = 32'h000045b3;
    ram_cell[       4] = 32'hfff68613;
    ram_cell[       5] = 32'h00261613;
    ram_cell[       6] = 32'h008000ef;
    ram_cell[       7] = 32'h0000006f;
    ram_cell[       8] = 32'h0cc5da63;
    ram_cell[       9] = 32'h0005e333;
    ram_cell[      10] = 32'h000663b3;
    ram_cell[      11] = 32'h006502b3;
    ram_cell[      12] = 32'h0002a283;
    ram_cell[      13] = 32'h04735263;
    ram_cell[      14] = 32'h00750e33;
    ram_cell[      15] = 32'h000e2e03;
    ram_cell[      16] = 32'h005e4663;
    ram_cell[      17] = 32'hffc38393;
    ram_cell[      18] = 32'hfedff06f;
    ram_cell[      19] = 32'h00650eb3;
    ram_cell[      20] = 32'h01cea023;
    ram_cell[      21] = 32'h02735263;
    ram_cell[      22] = 32'h00650e33;
    ram_cell[      23] = 32'h000e2e03;
    ram_cell[      24] = 32'h01c2c663;
    ram_cell[      25] = 32'h00430313;
    ram_cell[      26] = 32'hfedff06f;
    ram_cell[      27] = 32'h00750eb3;
    ram_cell[      28] = 32'h01cea023;
    ram_cell[      29] = 32'hfc7340e3;
    ram_cell[      30] = 32'h00650eb3;
    ram_cell[      31] = 32'h005ea023;
    ram_cell[      32] = 32'hffc10113;
    ram_cell[      33] = 32'h00112023;
    ram_cell[      34] = 32'hffc10113;
    ram_cell[      35] = 32'h00b12023;
    ram_cell[      36] = 32'hffc10113;
    ram_cell[      37] = 32'h00c12023;
    ram_cell[      38] = 32'hffc10113;
    ram_cell[      39] = 32'h00612023;
    ram_cell[      40] = 32'hffc30613;
    ram_cell[      41] = 32'hf7dff0ef;
    ram_cell[      42] = 32'h00012303;
    ram_cell[      43] = 32'h00410113;
    ram_cell[      44] = 32'h00012603;
    ram_cell[      45] = 32'h00410113;
    ram_cell[      46] = 32'h00012583;
    ram_cell[      47] = 32'hffc10113;
    ram_cell[      48] = 32'h00c12023;
    ram_cell[      49] = 32'hffc10113;
    ram_cell[      50] = 32'h00612023;
    ram_cell[      51] = 32'h00430593;
    ram_cell[      52] = 32'hf51ff0ef;
    ram_cell[      53] = 32'h00012303;
    ram_cell[      54] = 32'h00410113;
    ram_cell[      55] = 32'h00012603;
    ram_cell[      56] = 32'h00410113;
    ram_cell[      57] = 32'h00012583;
    ram_cell[      58] = 32'h00410113;
    ram_cell[      59] = 32'h00012083;
    ram_cell[      60] = 32'h00410113;
    ram_cell[      61] = 32'h00008067;

end

always @ (posedge clk)
    douta <= addra_valid ? ram_cell[addral] : 0;
    
always @ (posedge clk)
    doutb <= addrb_valid ? ram_cell[addrbl] : 0;

always @ (posedge clk)
    if(web & addrb_valid) 
        ram_cell[addrbl] <= dinb;

endmodule

//功能说明
    //同步读写bram，a口只读，用于取指，b口可读写，用于外接debug_module进行读写
    //写使能为1bit，不支持byte write
//输入
    //clk               输入时钟
    //addra             a口读地址
    //addrb             b口读写地�?
    //dinb              b口写输入数据
    //web               b口写使能
//输出
    //douta             a口读数据
    //doutb             b口读数据
//实验要求  
    //无需修改