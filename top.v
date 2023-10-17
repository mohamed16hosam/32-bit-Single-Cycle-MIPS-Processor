module top (
 input wire                     CLK,Reset,
 output wire     [15:0]      test_value
);

wire                 [31:0]      Instr,ReadData,PC,ALUOut,WriteData ;  
wire                               MemWrite ;   

Instr_memory U_instrmem (
.A(PC),
.RD(Instr)
);

Data_Memory U_datamem (
.A(ALUOut),
.WD(WriteData),
.WE(MemWrite),
.CLK(CLK),
.rst(Reset),
.RD(ReadData),
.test_value(test_value) 
);

MIPS U_mips (
.CLK(CLK),
.Reset(Reset),
.Instr(Instr),
.ReadData(ReadData),
.MemWrite(MemWrite),
.PC(PC),
.ALUOut(ALUOut),
.WriteData(WriteData) 
);

endmodule