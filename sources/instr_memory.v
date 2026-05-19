`timescale 1ns / 1ps

// INSTRUCTION MEMORY

module instr_memory (
    input [31:0] pc,
    output reg [31:0] instr
);

reg [31:0] ram [0:31];

integer i;

initial begin
    
        for( i = 0; i < 32; i = i + 1)
        ram[i] = 32'h00000013; 
end

initial begin

ram[0]  = 32'h00100293; // addi x5,  x0, 1
ram[1]  = 32'h00200393; // addi x7,  x0, 2
ram[2]  = 32'h0063AE13; // slti x28, x7, 6
ram[3]  = 32'h020E0663; // beq  x28, x0, done
ram[4]  = 32'h00028E93; // addi x29, x5, 0
ram[5]  = 32'h00000F13; // addi x30, x0, 0
ram[6]  = 32'h00038E13; // addi x28, x7, 0
ram[7]  = 32'h01DF0F33; // add  x30, x30, x29
ram[8] = 32'hFFFE0E13; // addi x28, x28, -1
ram[9] = 32'hFE0E1CE3; // bne  x28, x0, inner
ram[10] = 32'h000F02B3; // add  x5, x30, x0
ram[11] = 32'h00028533; // add  x10, x5, x0
ram[12] = 32'h00138393; // addi x7, x7, 1
ram[13] = 32'hFC000AE3; // beq  x0, x0, outer
ram[14] = 32'h00000063; // beq  x0, x0, done

end 

always @(*) begin
    instr = ram[pc[31:2]];

end
endmodule