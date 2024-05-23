module aludec(input logic opb_5,
 input logic [2:0] funct3,
 input logic funct7_5, 
 input logic [1:0] Alu_op,
 output logic [2:0] Alu_Controls);
 logic RtypeSub;
 assign RtypeSub = funct7_5 & opb_5; // TRUE for R-type subtract instruction
 always_comb
 case(Alu_op)
 2'b00: Alu_Controls = 3'b000; // addition
 2'b01: Alu_Controls = 3'b001; // subtraction
 default: case(funct3) // R-type or I-type ALU
 3'b000: if (RtypeSub) 
 Alu_Controls = 3'b001; // sub
 else 
 Alu_Controls = 3'b000; // add, addi
 3'b001: Alu_Controls = 3'b110; // sll, slli
3'b010: Alu_Controls = 3'b101; // slt, slti
3'b100: Alu_Controls = 3'b100; // xor, xori
3'b101: Alu_Controls = 3'b111; // srl, srli
3'b110: Alu_Controls = 3'b011; // or, ori
3'b111: Alu_Controls = 3'b010; // and, andi
 default:Alu_Controls = 3'bxxx; // ???
 endcase
 endcase
endmodule

