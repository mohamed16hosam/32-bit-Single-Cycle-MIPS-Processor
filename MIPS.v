module MIPS (
 input wire                        CLK,Reset,
 input wire         [31:0]       Instr,ReadData,
 output wire                      MemWrite,
 output wire       [31:0]       PC,ALUOut,WriteData         
);

wire                                  jump,PCSrc,MemtoReg,ALUSrc,RegDst,RegWrite,Zero ;
wire                  [2:0]         ALUControl ;


Datapath U_datapath (
.CLK(CLK),
.Reset(Reset),
.jump(jump),
.PCSrc(PCSrc),
.MemtoReg(MemtoReg),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.RegWrite(RegWrite),
.ALUControl(ALUControl),
.Instr(Instr),
.ReadData(ReadData),
.PC(PC),
.ALUOut(ALUOut),
.WriteData(WriteData),
.Zero(Zero)
);

Controller U_controller (
.Instr(Instr),
.Zero(Zero),
.ALUControl(ALUControl),
.jump(jump),
.PCSrc(PCSrc),
.MemtoReg(MemtoReg),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.RegWrite(RegWrite),
.MemWrite(MemWrite)
);


endmodule