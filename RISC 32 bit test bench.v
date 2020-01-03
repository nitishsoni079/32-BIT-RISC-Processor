// Code your testbench here
// or browse Examples
module MIPS32_tb();
  reg clk1, clk2;
  integer k;
  
  MIPS32 instant(
    .clk1(clk1),
    .clk2(clk2)
  );
  
  initial begin
    clk1 = 0; clk2 = 0;
    repeat(20)
      begin
        #5 clk1 = 1'b1; 
        #5 clk1 = 1'b0;
        #5 clk2 = 1'b1;
        #5 clk2 = 1'b0;
      end
  end
  
  initial begin
    for(k=0; k<32; k=k+1)
      begin
        instant.Reg[k] = k;
      end
    
    instant.Memory[0] = 32'h2801000a;
    instant.Memory[1] = 32'h28020014;
    instant.Memory[2] = 32'h28030019;
    instant.Memory[3] = 32'h0ce77800;
    instant.Memory[4] = 32'h0ce77800;
    instant.Memory[5] = 32'h00222000;
    instant.Memory[6] = 32'h0ce77800;
    instant.Memory[7] = 32'h00832800;
    instant.Memory[8] = 32'hfc000000;
    
    instant.HALTED = 0;
    instant.PC = 0;
    instant.TAKEN_BRANCH = 0;
    
    #280
    
    for(k=0; k<6; k=k+1)
      begin
        $display("R%1d - %2d", k, instant.Reg[k]);
      end
  end
   
    initial begin
    $dumpfile("dump.vcd");
      $dumpvars(1, MIPS32_tb);
      #300
      $finish();
    end
endmodule
 
    
      
      
  