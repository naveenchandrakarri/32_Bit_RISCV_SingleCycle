`timescale 1ns / 1ps

module wrapper(
    input clk,            
    input btnC,         
    output [15:0] led ,
    output [3:0] an,       
    output [6:0] seg  
    );
    
    wire slow_clk;
    wire [31:0] alu_result;
    
clk_divider divider_inst (clk, btnC, slow_clk);

datapath cpu_inst (slow_clk, btnC,alu_result);

assign led = alu_result[15:0];

seven_seg_controller hex_display (clk, btnC , alu_result[15:0], an, seg);

endmodule
