`timescale 1ns / 1ps

module resultmux(
    input [1:0] resultsrc,
    input[31:0] alu_result,
    input[31:0] readdata,
    input[31:0] pc_4,
    input[31:0] immext,
    output reg [31:0] result
    );

    always @(*) begin

        case(resultsrc)
        2'b00 : result = alu_result;
        2'b01 : result = readdata;
        2'b10 : result = pc_4;
        2'b11 : result = immext;
        default : result = 32'b0;

    endcase
    end

endmodule