//`timescale 1ns / 1ps
module Alu_64bit(
    input [63:0]a, b,
    input [3:0] ALUOp,
    output reg [63:0] Result,
    output reg ZERO,
    output reg Is_greater
    );

   always @ (ALUOp, a, b)
      begin
        case (ALUOp)
        4'b0000: Result = a & b;
        4'b0001: Result = a | b;
        4'b0010: Result = a + b;
        4'b0110: Result = a - b;
        4'b1100: Result = ~(a | b);
        //LESSTHAN: Result = ( a < b )? 0:1;
        4'b0111: Result = a << b;
        endcase
      if (Result ==64'd0)
        ZERO=1'b1;
      else
        ZERO=1'b0;
      
      Is_greater= (a > b) ? 1'b1 : 1'b0;
      end
  
endmodule