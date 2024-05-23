module Top1(input logic clk,reset,
	   output logic [31:0] write_data,Data_add,
	   output logic memwrite);

logic [31:0] pc,instr,read_data;

riscv_single s1(.clk(clk),.reset(reset),.instr(instr),.pc(pc),.Alu_result(Data_add),.writedata(write_data),.read_data(read_data),.memwrite(memwrite));
imem imem(.a(pc),.rd(instr));
dmem dmem(.clk(clk),.we(memwrite),.a(Data_add),.wd(write_data),.rd(read_data));

endmodule
