module ALU (
 input wire      [2:0]      ALUControl ,
 input wire      [31:0]    SrcA ,SrcB ,
 output reg     [31:0]    ALUResult,
 output wire                Zero
);

assign Zero=(ALUResult==32'b0) ? 1'b1:1'b0 ;

always @(*)
 begin
     case(ALUControl)
	 3'b000 : ALUResult=SrcA & SrcB ;
	 3'b001 : ALUResult=SrcA | SrcB ;
	 3'b010 : ALUResult=SrcA + SrcB ;
	 3'b100 : ALUResult=SrcA - SrcB ;
	 3'b101 : ALUResult=SrcA * SrcB ;
	 3'b110 : 
	  begin
	     if(SrcA<SrcB)
		  ALUResult=32'b1 ;
		 else
		  ALUResult=32'b0 ;
	  end
	 
	 default : ALUResult=32'b0 ;
	 
	 endcase
 end

endmodule