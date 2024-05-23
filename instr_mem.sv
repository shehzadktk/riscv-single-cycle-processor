module imem(input logic [31:0] a,
 output logic [31:0] rd);
 logic [31:0] RAM[63:0];
 initial
 $readmemh("code",RAM);
 assign rd = RAM[a[31:2]]; // word aligned
endmodule