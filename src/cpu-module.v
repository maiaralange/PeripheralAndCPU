`timescale 1ns / 1ps

module fsmCPU(clk,rst,ack,send,data);
  
  	input clk, rst, ack;
  	reg state, nextState;
  	output reg [3:0] data;
	output reg send;
  
	// STATE
  	always @ (posedge clk)
    begin
        if (rst == 1)
          	state <= 0;
        else
          	state <= nextState;
    end

	// NEXT STATE
	always @ (*)
	begin
    	case ({state})
	 		0, 1:
              begin
                  if (ack == 1)
                      nextState = 0;
                  else
                      nextState = 1;
              end
		endcase
	end

	// OUTPUTS
	always @ (*)
	begin
      	case ({state})
			0:
              begin
            	  send = 0;
              end
			1:
           	  begin
                  data = $urandom%(15);
			  	  send = 1;
              end
		endcase
	end
  
endmodule