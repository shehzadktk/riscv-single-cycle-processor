module riscv_single(input logic clk,reset,
		    input logic [31:0] instr,
		    output logic [31:0] pc,
		    output logic [31:0] Alu_result,writedata,
		    input logic [31:0] read_data,
		    output logic memwrite);


logic regwrite,Alusrc,jump,zero,pcsrc;
logic [1:0] immsrc,resultsrc;
logic [2:0] Alu_controls;

controller c1(.op(instr[6:0]),.funct3(instr[14:12]),.funct7_5(instr[30]),.memwrite(memwrite),.regwrite(regwrite),.Alusrc(Alusrc),.pcsrc(pcsrc),.jump(jump),.immsrc(immsrc),.resultsrc(resultsrc),.Alu_controls(Alu_controls),.zero(zero));

datapath_riscv d1(.clk(clk),.reset(reset),.regwrite(regwrite),.Alusrc(Alusrc),.pcsrc(pcsrc),.immsrc(immsrc),.resultsrc(resultsrc),.Alu_control(Alu_controls),.instr(instr),.read_data(read_data),.pc(pc),.write_data(writedata),.Alu_result(Alu_result),.zero(zero));

endmodule
