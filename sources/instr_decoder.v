`timescale 1ns / 1ps

// INSTRUCTION DECODER

module instr_decoder(
    input [31:0] instr,
    output reg [6:0] func7,
    output reg [4:0] rs2,
    output reg [4:0] rs1,
    output reg [2:0] func3,
    output reg [4:0] rd,
    output reg [6:0] opcode,
    output reg [31:0] imm
);

always @ (*) begin

    func7 = instr[31:25];
    rs2 = instr[24:20];
    rs1 = instr[19:15];
    func3 = instr[14:12];
    rd = instr[11:7];
    opcode = instr[6:0];
    imm = instr[31:0];

end
endmodule
