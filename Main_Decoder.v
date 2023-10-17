module Main_Decoder (
 input wire           [5:0]          opCode,
 output reg                           jump,memWrite,regWrite,regDest,aluSrc,memtoReg,Branch,
 output reg          [1:0]          aluOp
);

always @(*)
 begin
     jump=1'b0 ;
	 memWrite=1'b0 ;
	 regWrite=1'b0 ;
	 regDest=1'b0 ;
	 aluSrc=1'b0 ;
	 memtoReg=1'b0 ;
	 Branch=1'b0 ;
	 aluOp=2'b00 ;
	 
     case(opCode)
	 6'b100011 : 
	  begin
	     regWrite=1'b1 ;
         aluSrc=1'b1 ;
         memtoReg=1'b1 ;		 
	  end
	  
	 6'b101011 : 
	  begin
	     memWrite=1'b1 ;
		 aluSrc=1'b1 ;
		 memtoReg=1'b1 ;
	  end
	  
	 6'b000000 : 
	  begin
	     aluOp=2'b10 ;
		 regWrite=1'b1 ;
		 regDest=1'b1 ;
	  end
	  
	 6'b001000 : 
	  begin
	     regWrite=1'b1 ;
		 aluSrc=1'b1 ;
	  end
	  
	 6'b000100 : 
	  begin
	     aluOp=2'b01 ;
		 Branch=1'b1 ;
	  end
	  
	 6'b000010 : 
	  begin
	     jump=1'b1 ;
	  end
	 
	 default : 
	  begin
	     jump=1'b0 ;
	     memWrite=1'b0 ;
	     regWrite=1'b0 ;
	     regDest=1'b0 ;
	     aluSrc=1'b0 ;
	     memtoReg=1'b0 ;
	     Branch=1'b0 ;
	     aluOp=2'b00 ;
	  end
	 
	 endcase
 end

endmodule