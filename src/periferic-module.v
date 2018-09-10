`timescale 1ns / 1ps

module fsmPeriferic(clk,rst,ack,send,newData);
  
  	input clk, rst, send;
  	input [3:0] newData;
	reg state, nextState;
  	reg [3:0] data;
	output reg ack;

	// STATE
  	always @ (posedge clk)
	begin
        if(rst == 1)
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
                  if(send == 1)
                      nextState = 1;
                  else
                      nextState = 0;
              end
		endcase
	end

  	// OUTPUTS
	always @ (*)
	begin
       	case ({state})
			0:
              begin
                  ack = 0;
              end
			1:
              begin
                  data = newData;
                  ack = 1;
              end
		endcase
	end
  
endmodule