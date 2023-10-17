module Reg_File(
 input wire         [4:0]         A1,A2,A3,
 input wire                         CLK,WE3,rst,
 input wire         [31:0]        WD3,
 output reg        [31:0]        RD1,RD2
);

reg                    [31:0]        regfile     [0:99]  ;
integer                               i ;

always @(posedge CLK or negedge rst)
 begin
     if(!rst)
	  begin
	     for(i=0;i<100;i=i+1)
		 regfile[i]<=32'b0 ;
	  end
	  
	 else if(WE3)
	  begin
	     regfile[A3]<=WD3 ;
	  end
	 
 end

always @(*)
 begin
     if(!rst)
	  begin
         RD1=32'b0 ;
	     RD2=32'b0 ;	     
	  end
	  
	 else
	  begin
         RD1=regfile[A1] ;
	     RD2=regfile[A2] ;
	  end
	  
 end
 
endmodule