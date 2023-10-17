module Controller (
 input wire      [31:0]        Instr,
 input wire                      Zero,
 output wire    [2:0]         ALUControl,
 output wire                    jump,PCSrc,MemtoReg,ALUSrc,RegDst,RegWrite,MemWrite
);

wire                [1:0]         ALUOp ;
wire                                Branch ;

assign PCSrc=Branch & Zero ;

ALU_Decoder U_ALUDEC (
.Funct(Instr[5:0]),
.ALUOp(ALUOp),
.ALUControl(ALUControl)
);

Main_Decoder U_maindec (
.opCode(Instr[31:26]),
.jump(jump),
.memWrite(MemWrite),
.regWrite(RegWrite),
.regDest(RegDst),
.aluSrc(ALUSrc),
.memtoReg(MemtoReg),
.Branch(Branch),
.aluOp(ALUOp)
);



endmodule