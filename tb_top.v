`timescale 1ns / 1ps

module tb_top();
    
    reg clk;
    wire [31:0] alu_result;
    reg reset;
    datapath dut (
        .clk(clk),
        .reset(reset),
   .out(alu_result)
    );

    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;
        #20 reset = 0 ;
    

       

    end

endmodule
