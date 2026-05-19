`timescale 1ns / 1ps

// CONTROL UNIT 

module control_unit(
    input [6:0] opcode,
    output reg regwrite,
    output reg [2:0] immsrc ,
    output reg alusrcA,
    output reg alusrcB,
    output reg memwrite,
    output reg [1:0] resultsrc,
    output reg branch,
    output reg [1:0] aluop ,
    output reg jump
);

always @ (*) begin
{regwrite, immsrc, alusrcA, alusrcB, memwrite, resultsrc, branch, aluop, jump} = 12'b0;
    case(opcode)
    
    // LOAD
    7'b0000011 : begin
        regwrite = 1'b1 ;
        immsrc = 3'b000 ;
        alusrcA = 1'b0;
        alusrcB = 1'b1 ;
        memwrite = 1'b0 ;
        resultsrc = 2'b01 ;
        branch = 1'b0 ;
        aluop = 2'b00 ;
        jump = 1'b0 ;
    end

    // S-TYPE 
    7'b0100011 : begin
        regwrite = 1'b0 ;
        immsrc = 3'b001 ;
        alusrcA = 1'b0;
        alusrcB = 1'b1 ;
        memwrite = 1'b1 ;
        resultsrc = 2'b00 ;
        branch = 1'b0 ;
        aluop = 2'b00 ;
        jump = 1'b0 ;
    end
    
    // R-TYPE 
     7'b0110011 : begin
        regwrite = 1'b1 ;
        immsrc = 3'b000 ;
        alusrcA = 1'b0;
        alusrcB = 1'b0 ;
        memwrite = 1'b0 ;
        resultsrc = 2'b00 ;
        branch = 1'b0 ;
        aluop = 2'b10 ;
        jump = 1'b0 ;
    end

    // B-TYPE 
     7'b1100011 : begin
        regwrite = 1'b0 ;
        immsrc = 3'b010 ;
        alusrcA = 1'b0;
        alusrcB = 1'b0 ;
        memwrite = 1'b0 ;
        resultsrc = 2'b00 ;
        branch = 1'b1 ;
        aluop = 2'b01 ;
        jump = 1'b0 ;
    end
    
    // I-TYPE (ALU)
     7'b0010011 : begin
        regwrite = 1'b1 ;
        immsrc = 3'b000 ;
        alusrcA = 1'b0;
        alusrcB = 1'b1 ;
        memwrite = 1'b0 ;
        resultsrc = 2'b00 ;
        branch = 1'b0 ;
        aluop = 2'b10 ;
        jump = 1'b0 ;
    end

    //J-TYPE
     7'b1101111 : begin
        regwrite = 1'b1 ;
        immsrc = 3'b011 ;
        alusrcA = 1'b0;
        alusrcB = 1'b0 ;
        memwrite = 1'b0 ;
        resultsrc = 2'b10 ;
        branch = 1'b0 ;
        aluop = 2'b00 ;
        jump = 1'b1 ;
    end

    // JALR 
     7'b1100111 : begin
        regwrite = 1'b1 ;
        immsrc = 3'b000 ;
        alusrcA = 1'b0;
        alusrcB = 1'b1 ;
        memwrite = 1'b0 ;
        resultsrc = 2'b10 ;
        branch = 1'b0 ;
        aluop = 2'b00 ;
        jump = 1'b1 ;
    end

    // LUI
     7'b0110111 : begin
        regwrite = 1'b1 ;
        immsrc = 3'b100 ;
        alusrcA = 1'b0;
        alusrcB = 1'b1 ;
        memwrite = 1'b0 ;
        resultsrc = 2'b11 ;
        branch = 1'b0 ;
        aluop = 2'b00 ;
        jump = 1'b0 ;
    end

    // AUIPC
     7'b0010111 : begin
        regwrite = 1'b1 ;
        immsrc = 3'b100 ;
        alusrcA = 1'b1;
        alusrcB = 1'b1 ;
        memwrite = 1'b0 ;
        resultsrc = 2'b00 ;
        branch = 1'b0 ;
        aluop = 2'b00 ;
        jump = 1'b0 ;
    end

    endcase
end

endmodule
