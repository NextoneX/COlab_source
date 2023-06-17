`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design Name: RISCV-Pipline CPU
// Module Name: HarzardUnit
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: Deal with harzards in pipline
//////////////////////////////////////////////////////////////////////////////////
module HarzardUnit(
    input wire CpuRst, ICacheMiss, DCacheMiss, 
    input wire BranchE, JalrE, JalD, 
    input wire [4:0] Rs1D, Rs2D, Rs1E, Rs2E, RdE, RdMW,
    input wire [1:0] RegReadE,
    input wire MemToRegE,
    input wire [2:0] RegWriteMW,
    output reg StallF, FlushF, StallD, FlushD, StallE, FlushE,  StallMW, FlushMW,
    output reg Forward1E, Forward2E
    );
    //Stall and Flush signals generate
    always@(*)
	begin
		if(CpuRst)
			{StallF, FlushF, StallD, FlushD, StallE, FlushE, StallMW, FlushMW} <= 8'b01010101;
        else if(DCacheMiss)
	        {StallF, FlushF, StallD, FlushD, StallE, FlushE, StallMW, FlushMW} <= 8'b10101010;
		else if(BranchE || JalrE)
			{StallF, FlushF, StallD, FlushD, StallE, FlushE, StallMW, FlushMW} <= 8'b00010100;
		else if(JalD)
			{StallF, FlushF, StallD, FlushD, StallE, FlushE, StallMW, FlushMW} <= 8'b00010000;
		else if( MemToRegE && ((RdE == Rs1D)||(RdE == Rs2D)))
			{StallF, FlushF, StallD, FlushD, StallE, FlushE, StallMW, FlushMW} <= 8'b10100100;
		else
			{StallF, FlushF, StallD, FlushD, StallE, FlushE, StallMW, FlushMW} <= 8'b00000000;
	end
    //Forward Register Source 1
    always@(*)		
	begin
		if(RegReadE[1] && RegWriteMW!=3'b0 && RdMW != 5'b0  && RdMW == Rs1E) 
                Forward1E <= 1'b1;
            else
                Forward1E <= 1'b0;
	end
    //Forward Register Source 2
    always@(*)		
	begin
		if(RegReadE[0] && RegWriteMW!=3'b0 && RdMW != 5'b0  && RdMW == Rs2E ) 
                Forward2E <= 1'b1;
            else
                Forward2E <= 1'b0;
	end
    
endmodule

//����˵��
    //HarzardUnit����������ˮ�߳�ͻ��ͨ���������ݣ�forward�Լ���ˢ��ˮ�ν��������غͿ�����أ�����߼���·
    //�������ʵ�֡�ǰ�ڲ���CPU��ȷ��ʱ��������ÿ����ָ������������ָ�Ȼ��ֱ�Ӱѱ�ģ�������Ϊ����forward����stall����flush 
//����
    //CpuRst                                    �ⲿ�źţ�������ʼ��CPU����CpuRst==1ʱCPUȫ�ָ�λ���㣨���жμĴ���flush����Cpu_Rst==0ʱcpu��ʼִ��ָ��
    //ICacheMiss, DCacheMiss                    Ϊ����ʵ��Ԥ���źţ���ʱ�������ӣ���������cache miss
    //BranchE, JalrE, JalD                      ��������������
    //Rs1D, Rs2D, Rs1E, Rs2E, RdE, RdMW     	��������������أ��ֱ��ʾԴ�Ĵ���1���룬Դ�Ĵ���2���룬Ŀ��Ĵ�������
    //RegReadE RegReadD[1]==1                   ��ʾA1��Ӧ�ļĴ���ֵ��ʹ�õ��ˣ�RegReadD[0]==1��ʾA2��Ӧ�ļĴ���ֵ��ʹ�õ��ˣ�����forward�Ĵ���
    //RegWriteMW                      			��������������أ�RegWrite!=3'b0˵����Ŀ��Ĵ�����д�����
    //MemToRegE                                 ��ʾEx�ε�ǰָ�� ��Data Memory�м������ݵ��Ĵ�����
//���
    //StallF, FlushF, StallD, FlushD, StallE, FlushE, StallMW, FlushMW    �����ĸ��μĴ�������stall��ά��״̬���䣩��flush�����㣩
    //Forward1E, Forward2E                                                              ����forward
//ʵ��Ҫ��  
    //ʵ��HarzardUnitģ��   