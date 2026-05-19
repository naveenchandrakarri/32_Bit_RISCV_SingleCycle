`timescale 1ns / 1ps

// REGISTER FILE 

module reg_file(
    input clk , 
    input reset,
    input [4:0] ra1 ,
    input [4:0] ra2 ,
    input [4:0] wa3 ,
    input [31:0] wd3 ,
    input we3 ,
    output [31:0] rd1 ,
    output [31:0] rd2
    );

     reg [31:0] regf [31:0] ;
     integer i;
     
    always @ (posedge clk) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                regf[i] <= 32'b0;
            end
        end
        else if(we3 && wa3 != 0) begin 
            regf[wa3] <= wd3 ;
        end
    end

    assign rd1 = (ra1 != 0) ? regf[ra1] : 32'b0 ;
    assign rd2 = (ra2 != 0) ? regf[ra2] : 32'b0 ;

endmodule