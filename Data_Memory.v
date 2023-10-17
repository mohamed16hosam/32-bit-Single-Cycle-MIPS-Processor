module Data_Memory (
 input wire        [31:0]          A,WD,
 input wire                          WE,CLK,rst,
 output reg       [31:0]          RD,
output reg        [15:0]          test_value 
);

reg                   [31:0]          Mem           [0:99] ;
integer                                i ;

always @(posedge CLK or negedge rst)
 begin
     if(!rst)
	  begin
	     for(i=0;i<99;i=i+1)
		 Mem[i]<=32'b0 ;
	  end
	  
	 else if (WE)
	  begin
	     Mem[A]<=WD ;
	  end
	 
 end

always @(*)
 begin
     if(!rst)
	  begin
	     RD=32'b0 ;
		 test_value=16'b0 ;
	  end
	  
	 else
	  begin
	     RD=Mem[A] ;
		 test_value=Mem[0] [15:0] ;
	  end
	  
 end 
 
endmodule