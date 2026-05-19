`timescale 1ns / 1ps

// DATAPATH

module datapath(
    input clk,
    input reset,
    output [31:0] out
);

    wire [31:0] pc_next ;
    wire [31:0] pc ;
    wire [31:0] instr ;
    wire [31:0] pc_4 ;
    wire [6:0] opcode ;
    wire [31:0] imm;
    wire [4:0] rs1 ;
    wire [4:0] rs2 ;
    wire [4:0] rd ;
    wire [2:0] funct3 ;
    wire [6:0] funct7 ;

    wire [31:0] wd3 ;
    wire [31:0] rd1 ;
    wire [31:0] rd2 ;
    wire regwrite ;
    wire alusrcA ;
    wire alusrcB ;
    wire memwrite ;
    wire [2:0] immsrc ;
    wire [1:0] resultsrc ;
    wire jump ;
    wire [31:0] immext ;

    wire [3:0] alu_control ;
    wire [31:0] A ;
    wire [31:0] B ;
    wire zero ;
    wire [31:0] pc_target ;
    wire [1:0] pcsrc ;
    wire [31:0] readdata ;
    wire [31:0] alu_result ;

pc p1(pc_next, clk, reset, pc);

pc_plus4 p4(pc, pc_4);

instr_memory imem(pc, instr);

instr_decoder id(instr, funct7, rs2, rs1, funct3, rd, opcode, imm);

controller main_ctrl(
    opcode, funct3, funct7[5], zero, alu_result[0],
    regwrite, immsrc, alusrcA, alusrcB, memwrite, resultsrc, pcsrc, alu_control
);

sign_extender se(immsrc, imm, immext);

pc_target pt(pc, immext, pc_target);

reg_file rf(clk,reset, rs1, rs2, rd, wd3, regwrite, rd1, rd2);

mux2 srca_mux(rd1, pc, alusrcA, A);

mux2 srcb_mux(rd2, immext, alusrcB, B);

ALU alu_unit(alu_control, A, B, alu_result, zero);

data_memo dmem(clk, memwrite, funct3, alu_result, rd2, readdata);

resultmux res_mux(resultsrc, alu_result, readdata, pc_4, immext, wd3);

mux3 pcmux(pc_4, pc_target, alu_result, pcsrc, pc_next);

assign out = rf.regf[10];

endmodule