`timescale 1ns / 1ps

// CONTROLLER

module controller(
    input [6:0] opcode,
    input [2:0] funct3,
    input funct7,
    input zero,
    input alu_result,
    output wire regwrite,
    output wire [2:0] immsrc,
    output wire alusrcA,   
    output wire alusrcB,
    output wire memwrite,
    output wire [1:0] resultsrc,
    output reg [1:0] pcsrc,
    output wire [3:0] alu_control
);

wire jump;
wire branch;
wire [1:0] aluop;

control_unit c1( opcode , regwrite , immsrc , alusrcA , alusrcB ,
                 memwrite , resultsrc , branch, aluop , jump );

alu_decoder a1( aluop , funct3 , funct7 , opcode[5] , alu_control );

reg condition;

always @(*) begin
    case(funct3)
        3'b000: condition = zero;        
        3'b001: condition = !zero;       
        3'b100: condition = alu_result;
        3'b101: condition = ~alu_result;
        3'b110: condition = alu_result;
        3'b111: condition = ~alu_result;
        default: condition = 1'b0;
    endcase
end

always @(*) begin

    if (jump) begin

        if(opcode == 7'b1100111)
        pcsrc = 2'b10;

        else
        pcsrc = 2'b01;

    end

    else if (branch && condition)
    pcsrc = 2'b01;

    else
    pcsrc = 2'b00;

    end

endmodule