module testbench();
 logic clk;
 logic reset;
 logic [31:0] WriteData, DataAdr;
 logic MemWrite;
 // instantiate device to be tested
 Top1 dut(clk, reset, WriteData, DataAdr ,MemWrite );
 
 // initialize test
 initial
 begin
 reset <= 1; # 22; reset <= 0;
 end
 // generate clock to sequence tests
 always
 begin
 clk <= 1; # 5; clk <= 0; # 5;
 end
 // check results
 always @(negedge clk)
 begin
 if(MemWrite) begin
 if(DataAdr === 216 & WriteData === 4140) begin
 $display("Simulation succeeded");
 $stop;
 end
 end
 end
endmodule
