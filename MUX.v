module MUX #(parameter WIDTH=32)
(
 input wire    [WIDTH-1:0]     In1,In2,
 input wire                          Sel,
 output reg   [WIDTH-1:0]     out
);

always @(*)
 begin
     if(Sel)
	 out=In1 ;
	 else
	 out=In2 ;
 end

endmodule