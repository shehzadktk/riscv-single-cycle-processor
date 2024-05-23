module controller(input logic [6:0] op,
		  input logic [2:0] funct3,
		  input logic funct7_5,
		  output logic memwrite,regwrite,Alusrc,pcsrc,jump,
		  output logic [1:0] immsrc,resultsrc,
		  output logic [2:0] Alu_controls,
		  input logic zero);

logic branch;
logic [1:0] Alu_op;

main_dec dec(.op(op),.regwrite(regwrite),.memwrite(memwrite),.Alusrc(Alusrc),.jump(jump),.branch(branch),.immsrc(immsrc),.resultsrc(resultsrc),.Alu_op(Alu_op));
aludec decoder(.Alu_op(Alu_op),.funct3(funct3),.funct7_5(funct7_5),.opb_5(op[5]),.Alu_Controls(Alu_controls));

assign pcsrc = (branch & (zero ^ funct3[0])) | jump;
endmodule
