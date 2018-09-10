// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module testasemaforo;

    // Inputs
    reg TA;
    reg TB;
    reg clk;
    reg rst;

    // Outputs
    wire [1:0] LA;
    wire [1:0] LB;

    // Instantiate the Unit Under Test (UUT)
    fsmAulaSinaleira uut (
        .TA(TA),  
        .TB(TB),  
        .LA(LA),  
        .LB(LB),  
        .clk(clk),  
        .rst(rst)
    );

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
        // Initialize Inputs
        TA = 0;
        TB = 0;
        clk = 0;
        rst = 1;

        // Wait 100 ns for global reset to finish
        #100;
        rst = 0;
        #100
         
        // Add stimulus here
        TA = 1;
        #50;
        TB = 1;
        #10;
        TA = 0;
        #30;
        TB = 0;
        TA = 1;
     
      $finish;
    end
   always #5 clk = !clk;
endmodule