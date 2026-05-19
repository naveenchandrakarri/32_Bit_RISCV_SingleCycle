`timescale 1ns / 1ps

module clk_divider(
    input clk_in,     
    input reset,       
    output clk_out 
);

reg [26:0] counter;

assign clk_out = (counter == 27'd99_999_999);

    always @(posedge clk_in or posedge reset) begin
        if (reset) 
            counter <= 27'd0;
        else if (clk_out)
            counter <= 27'd0;
        else
            counter <= counter + 1'b1;
    end
endmodule
