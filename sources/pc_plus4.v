`timescale 1ns / 1ps

// NEXT INSTRUCTION 

module pc_plus4 (
    input [31:0] pc,
    output reg [31:0] pc_next
);

always @ (*) begin
    pc_next = pc + 4;
end

endmodule
