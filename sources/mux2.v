`timescale 1ns / 1ps

// 2:1 MULTIPLEXER

module mux2 #(parameter width = 32)(
    input [width-1:0] d0 ,
    input [width-1:0] d1 ,
    input s,
    output reg [width-1:0] y
);

always @ (*) begin
    case(s)
    1'b0 : y = d0;
    1'b1 : y = d1;
    endcase
end

endmodule
