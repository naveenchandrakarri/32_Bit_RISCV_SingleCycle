`timescale 1ns / 1ps

// ARTHEMATIC LOGIC UNIT (ALU)

module ALU(
    input [3:0] alu_cntrl,
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] result,
    output zero
);

always @ (*) begin

    case(alu_cntrl)

    4'b0000 : result = A + B;
    4'b0001 : result = A - B;
    4'b0010 : result = A & B;
    4'b0011 : result = A | B;
    4'b0100 : result = A ^ B;
    4'b0101 : result = (A < B);
    4'b0110 : result = A << B[4:0]; 
    4'b0111 : result = A >> B[4:0];
    4'b1000 : result = $signed(A) >>> B[4:0] ;
    4'b1001 : result = ($unsigned(A) < $unsigned(B)) ;
    default : result = 32'b0 ;
    endcase

end

assign zero = (result == 32'b0) ;

endmodule