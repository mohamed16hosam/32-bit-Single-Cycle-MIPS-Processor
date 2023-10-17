module Instr_memory (
 input wire        [31:0]          A,
 output reg       [31:0]          RD
);

reg                   [31:0]          Mem      [0:99] ;
reg                   [31:0]          PC ;

initial
 begin
     $readmemh ("Program 2_Machine Code.txt", Mem) ;
 end

always @(*)
 begin
     PC=A>>2 ;
	 RD=Mem[PC] ;
 end

endmodule