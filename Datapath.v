module Datapath (
 input wire                     CLK,Reset,jump,PCSrc,MemtoReg,ALUSrc,RegDst,RegWrite,
 input wire      [2:0]         ALUControl,
 input wire      [31:0]       Instr,ReadData,
 output wire     [31:0]      PC,ALUOut,WriteData,
 output wire                   Zero
);

wire               [31:0]       SrcA,SrcB,Result,PCPlus4,shifted_SignImm,PCBranch,in_mux_2,PC_new,SignImm ;
wire               [4:0]         WriteReg ;
wire               [27:0]        out_shift_mux ;

MUX #(.WIDTH(32)) U_MUX1 (
.In1(PCBranch),
.In2(PCPlus4),
.Sel(PCSrc),
.out(in_mux_2)
);

MUX #(.WIDTH(32)) U_MUX2 (
.In1({PCPlus4[31:28] ,out_shift_mux}),
.In2(in_mux_2),
.Sel(jump),
.out(PC_new)
);

MUX #(.WIDTH(5)) U_MUX3 (
.In1(Instr[15:11]),
.In2(Instr[20:16]),
.Sel(RegDst),
.out(WriteReg)
);

MUX #(.WIDTH(32)) U_MUX4 (
.In1(SignImm),
.In2(WriteData),
.Sel(ALUSrc),
.out(SrcB)
);

MUX #(.WIDTH(32)) U_MUX5 (
.In1(ReadData),
.In2(ALUOut),
.Sel(MemtoReg),
.out(Result)
);

Shift_Left_twice #(.WIDTH(32)) U_shift1 (
.in(SignImm),
.out(shifted_SignImm)
);

Shift_Left_twice #(.WIDTH(28)) U_shift2 (
.in({2'b00,Instr[25:0]}),
.out(out_shift_mux)
);

Sign_Extend U_signextend (
.Instr(Instr[15:0]),
.SignImm(SignImm)
);

Adder U_adder1 (
.A(shifted_SignImm),
.B(PCPlus4),
.C(PCBranch)
);

Adder U_adder2 (
.A(PC),
.B(32'b100),
.C(PCPlus4)
);

PC U_PC (
.PC_new(PC_new),
.CLK(CLK),
.rst(Reset),
.PC(PC)
);

Reg_File U_regfile (
.A1(Instr[25:21]),
.A2(Instr[20:16]),
.A3(WriteReg),
.CLK(CLK),
.WE3(RegWrite),
.rst(Reset),
.WD3(Result),
.RD1(SrcA),
.RD2(WriteData)
);

ALU U_ALU (
.ALUControl(ALUControl),
.SrcA(SrcA),
.SrcB(SrcB),
.ALUResult(ALUOut),
.Zero(Zero)
);

endmodule