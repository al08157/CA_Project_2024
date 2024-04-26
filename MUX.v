module MUX
( input [63:0] a,b,
 input sel,
 output [63:0] out
);

assign out = sel ? a : b;

endmodule