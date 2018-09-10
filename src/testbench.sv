`timescale 1ns / 1ps

`include "cpu-module.v" 
`include "periferic-module.v" 

module testbench;

	reg firstRun, secondRun;
	reg clk1, rst1;
	reg clk2, rst2;
	wire send, ack;
  	wire [3:0] data;

	fsmPeriferic fsmPeriferic (
		.clk(clk1), 
      	.rst(rst1),
      	.ack(ack),
		.send(send), 
		.newData(data)
	);

  	fsmCPU fsmCPU (
		.clk(clk2), 
		.rst(rst2),
    	.ack(ack),
    	.send(send),
    	.data(data)
	);
  
  	initial begin
    	$dumpfile("dump.vcd");
    	$dumpvars(3);

        clk1 = 0;
        rst1 = 1;
        clk2 = 0;
        rst2 = 1;
		
      	#200
        
      	rst1 = 0;
        rst2 = 0;

    	#2000 
    
        firstRun = 0;
        secondRun = 0;
  	end

	// PERIFERIC
    initial begin
     	clk1 = 0;
        firstRun = 1;
      	while (firstRun) begin
        	#50 clk1 = ~clk1;
      	end
    end

	// CPU
	initial begin
  		clk2 = 0;
  		#50
  		secondRun = 1;
      	while (secondRun) begin
    		#25 clk2 = ~clk2;
  		end
	end
  
endmodule
