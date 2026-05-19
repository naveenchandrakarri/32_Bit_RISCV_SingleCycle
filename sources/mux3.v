`timescale 1ns / 1ps

// 3:1 MULTIPLEXER

module mux3 #(parameter width = 32)(
    input [width-1:0] d0 ,
    input [width-1:0] d1 ,
    input [width-1:0] d2 ,
    input [1:0] s,
    output reg [width-1:0] y
);

always @ (*) begin
    case(s)
    2'b00 : y = d0;
    2'b01 : y = d1;
    2'b10 : y = d2;
    default : y = {width{1'b0}} ;
    endcase
end

endmodule