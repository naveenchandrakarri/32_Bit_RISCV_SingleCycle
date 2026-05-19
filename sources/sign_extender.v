`timescale 1ns / 1ps

// SIGN EXTENDER

module sign_extender (
    input [2:0] immsrc,
    input [31:0] imm,
    output reg [31:0] immext
);

always @ (*) begin

    case (immsrc)

    3'b000 : immext = {{20{imm[31]}},imm[31:20]}; //I TYPE
    3'b001 : immext = {{20{imm[31]}},imm[31:25],imm[11:7]}; //S TYPE
    3'b010 : immext = {{20{imm[31]}},imm[7],imm[30:25],imm[11:8],1'b0};  //B TYPE
    3'b011 : immext = {{12{imm[31]}},imm[19:12],imm[20],imm[30:21],1'b0}; //J TYPE
    3'b100 : immext = {imm[31:12], 12'b0}; // U TYPE 
    default : immext = 32'b0;

    endcase

end

endmodule
