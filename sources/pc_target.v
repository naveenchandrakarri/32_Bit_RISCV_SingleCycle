`timescale 1ns / 1ps

// PC TARGET 

module pc_target (
    input [31:0] pc,
    input [31:0] immext,
    output reg [31:0] pc_target
);

always @ (*) begin
    pc_target = pc + immext;
end

endmodule