module PC (
 input wire     [31:0]     PC_new ,
 input wire                  CLK ,rst ,
 output reg    [31:0]     PC 
);

always @(posedge CLK or negedge rst)
 begin
     if(!rst)
	  PC<=32'b0 ;
	 else
	  PC<=PC_new ;
 end

endmodule