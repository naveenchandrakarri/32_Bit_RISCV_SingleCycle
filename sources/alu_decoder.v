`timescale 1ns / 1ps

// ALU DECODER

module alu_decoder(
    input [1:0] aluop,
    input [2:0] funct3,
    input funct7,
    input op5,
    output reg [3:0] alu_control 
);

always @(*) begin

    case(aluop)

    2'b00 : begin

        alu_control = 4'b0000;

    end

     2'b01 : begin

        if (funct3 == 3'b000 || funct3 == 3'b001) 
        alu_control = 4'b0001;

        else if (funct3 == 3'b100 || funct3 == 3'b101) 
        alu_control = 4'b0101;

        else if (funct3 == 3'b110 || funct3 == 3'b111) 
        alu_control = 4'b1001;

        else
        alu_control = 4'b0000;

     end

    2'b10 : begin

        if(funct3 == 3'b000 && !(funct7 & op5)) 
         alu_control = 4'b0000;
        
        else if (funct3 == 3'b000 && (funct7 & op5)) 
         alu_control = 4'b0001;
        
        else if (funct3 == 3'b010)
        alu_control = 4'b0101;
        
        else if (funct3 == 3'b110) 
        alu_control = 4'b0011;
        
        else if (funct3 == 3'b111) 
        alu_control = 4'b0010;
              
        else if (funct3 == 3'b101 && !(funct7)) 
            alu_control = 4'b0111; 
        
        else if (funct3 == 3'b101 && (funct7)) 
            alu_control = 4'b1000; 
        
        else if (funct3 == 3'b001) 
            alu_control = 4'b0110; 
        
        else if (funct3 == 3'b100) 
            alu_control = 4'b0100; 

        else if (funct3 == 3'b011)
            alu_control = 4'b1001; 
        
        else
        alu_control = 4'b0000;
 
        
    end

    default : alu_control = 4'b0000;

    endcase
end

endmodule
