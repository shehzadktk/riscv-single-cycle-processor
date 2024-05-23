module datapath_riscv(input logic clk,reset,
		input logic regwrite,Alusrc,pcsrc,
		input logic [1:0] immsrc,resultsrc,
		input logic [2:0] Alu_control,
		input logic [31:0] instr,read_data,
		output logic [31:0] pc,write_data,
		output logic [31:0] Alu_result,
		output logic zero);

logic [31:0] pcplus4,pcnext,pctarget;
logic [31:0] srcA,srcB;
logic [31:0] immext;
logic [31:0] result;


//Next pc logic

flipr1 f1(.clk(clk),.reset(reset),.d(pcnext),.q(pc));
adder1 a1(.a(pc),.b(32'd4),.c(pcplus4));
adder1 a2(.a(pc),.b(immext),.c(pctarget));
mux2 #(32) pcmux(.d0(pcplus4),.d1(pctarget),.s(pcsrc),.y(pcnext));

// regfile logic

regfile rf1(.clk(clk),.regwrite(regwrite),.a1(instr[19:15]), .a2(instr[24:20]), .a3(instr[11:7]), .wd3(result), .rd1(srcA), .rd2(write_data));
extend imm(.instr(instr[31:7]),.immsrc(immsrc),.immext(immext));

// Alulogic

mux2 #(32) alusrcmux(.d0(write_data),.d1(immext),.s(Alusrc),.y(srcB));
alu ALU(.a(srcA),.b(srcB),.alucontrol(Alu_control),.result(Alu_result),.zero(zero));
mux3 #(32) resultmux(.d0(Alu_result),.d1(read_data),.d2(pcplus4),.s(resultsrc),.y(result));


endmodule


