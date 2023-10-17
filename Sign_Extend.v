module Sign_Extend (
 input wire           [15:0]        Instr,
 output reg          [31:0]        SignImm
);

reg                      [15:0]        D ;  

always @(*)
 begin
     D={5'd16 {Instr[15]}} ;
	 SignImm={D, Instr} ;
 end

endmodule