`timescale 1ns / 1ps

// DATA MEMORY

module data_memo(
    input clk ,
    input we ,
    input [2:0] funct3,
    input [31:0] addr ,
    input [31:0] wd ,
    output [31:0] rd
);

reg [31:0] mem [0:31] ;

wire [31:0] word;
reg [31:0] load ,store;
reg [7:0] byte;
reg [15:0] half;

assign word = mem[addr[31:2]];

always @(*) begin
    case(addr[1:0])

    2'b00: byte = word[7:0];
    2'b01: byte = word[15:8];
    2'b10: byte = word[23:16];
    2'b11: byte = word[31:24];
    default: byte = 8'b0;

    endcase
end

always @(*) begin
    case(addr[1])

    1'b0: half = word[15:0];
    1'b1: half = word[31:16];
    default: half = 16'b0;

    endcase
end

always @(*) begin
    case(funct3)

    3'b000: load = {{24{byte[7]}}, byte[7:0]};
    3'b001: load = {{16{half[15]}}, half[15:0]};
    3'b010: load = word;
    3'b100: load = {24'b0, byte[7:0]};
    3'b101: load = {16'b0, half[15:0]};
    default: load = 32'b0 ;

    endcase
end

always @(*) begin
    case(funct3)

    3'b000:begin

        case(addr[1:0])
        2'b00: store = {word[31:8], wd[7:0]};
        2'b01: store = {word[31:16], wd[7:0], word[7:0]};
        2'b10: store = {word[31:24], wd[7:0], word[15:0]};
        2'b11: store = {wd[7:0], word[23:0]};
        default :store = 32'b0;

        endcase
    end

    3'b001:begin
        case(addr[1])
        1'b0: store = {word[31:16], wd[15:0]};
        1'b1: store = {wd[15:0], word[15:0]};
        default :store = 32'b0;

        endcase
    end

    3'b010:
        store = wd;

    default:
        store = word;

    endcase

end

 always @ (posedge clk) begin 
        if(we) begin 
         mem[addr[31:2]] <= store ;
        end
    end

    assign rd = load ;

endmodule