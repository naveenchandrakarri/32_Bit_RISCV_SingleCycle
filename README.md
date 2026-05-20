# 32-Bit RV32I Single-Cycle RISC-V Processor

A custom 32-bit RV32I (Reduced Instruction Set Computer - Five Instruction Set Architecture) single-cycle processor implemented in Verilog HDL.

This project was designed from scratch to understand and implement the complete datapath and control flow of a modern processor architecture. The processor supports arithmetic, logical, memory, branch, jump, and upper-immediate instructions from the RV32I base instruction set.

The processor includes:
- Instruction Fetch and Decode
- Register File
- Arithmetic Logic Unit (ALU)
- Immediate Generator
- Branch and Jump Control Logic
- Load/Store Memory System
- Controller and ALU Decoder
- FPGA Integration and Hardware Verification

The design was successfully simulated, verified, and deployed on FPGA using Xilinx Vivado. A factorial program was executed successfully on hardware to validate:
- arithmetic operations
- loops and branching
- memory access instructions
- signed and unsigned comparisons
- jump and control-flow instructions

The successful FPGA execution confirmed stable processor functionality and correct integration of the datapath, controller, ALU, and memory system.

---

# Architecture Overview

The processor follows a single-cycle architecture where every instruction completes execution in a single clock cycle.

The datapath includes:
- Program Counter (PC)
- Instruction Memory
- Register File
- Arithmetic Logic Unit (ALU)
- Immediate Generator
- Data Memory
- Branch and Jump Logic
- Writeback Multiplexers
- Controller and ALU Decoder

The processor supports:
- byte-addressable memory
- signed and unsigned arithmetic
- branch condition evaluation
- jump redirection
- upper immediate instructions
- load/store byte, halfword, and word operations

---

# Supported RV32I Instructions

## R-Type Instructions
- ADD  -> Add
- SUB  -> Subtract
- AND  -> Bitwise AND
- OR   -> Bitwise OR
- XOR  -> Bitwise Exclusive OR
- SLL  -> Shift Left Logical
- SRL  -> Shift Right Logical
- SRA  -> Shift Right Arithmetic
- SLT  -> Set Less Than
- SLTU -> Set Less Than Unsigned

---

## I-Type Instructions
- ADDI  -> Add Immediate
- ANDI  -> AND Immediate
- ORI   -> OR Immediate
- XORI  -> XOR Immediate
- SLTI  -> Set Less Than Immediate
- SLTIU -> Set Less Than Immediate Unsigned
- SLLI  -> Shift Left Logical Immediate
- SRLI  -> Shift Right Logical Immediate
- SRAI  -> Shift Right Arithmetic Immediate

---

## Load Instructions
- LB   -> Load Byte
- LH   -> Load Halfword
- LW   -> Load Word
- LBU  -> Load Byte Unsigned
- LHU  -> Load Halfword Unsigned

---

## Store Instructions
- SB -> Store Byte
- SH -> Store Halfword
- SW -> Store Word

---

## Branch Instructions
- BEQ  -> Branch if Equal
- BNE  -> Branch if Not Equal
- BLT  -> Branch if Less Than
- BGE  -> Branch if Greater Than or Equal
- BLTU -> Branch if Less Than Unsigned
- BGEU -> Branch if Greater Than or Equal Unsigned

---

## Jump Instructions
- JAL  -> Jump and Link
- JALR -> Jump and Link Register

---

## Upper Immediate Instructions
- LUI   -> Load Upper Immediate
- AUIPC -> Add Upper Immediate to Program Counter

---

# Key Features

- 32-bit RV32I single-cycle processor
- Modular Verilog HDL implementation
- Byte-addressable memory architecture
- Signed and unsigned comparison support
- Immediate generator supporting:
  - I-type
  - S-type
  - B-type
  - U-type
  - J-type
- Branch and jump control logic
- Full load/store subsystem
- FPGA verified execution
- Clean datapath and controller separation

---

# Project Structure

```text
rtl/
│
├── alu.v
├── alu_decoder.v
├── control_unit.v
├── controller.v
├── datapath.v
├── data_memory.v
├── instr_memory.v
├── reg_file.v
├── sign_extender.v
├── pc.v
├── pc_target.v
├── mux2.v
├── mux3.v
├── resultmux.v
├── clk_divider.v
└── wrapper.v

testbench/
|
└── cpu_tb.v

fpga/
│
├── constraints.xdc
└── FPGA wrapper files

```

---

# FPGA Implementation

The processor was synthesized and tested on:
- Digilent Basys3 FPGA Board
- AMD/Xilinx Artix-7 FPGA
- Xilinx Vivado Design Suite

A clock divider module was used to slow down execution for easier observation and debugging on hardware.

The FPGA implementation validated:
- instruction execution
- branch redirection
- jump handling
- register writeback
- load/store operations
- ALU functionality

---

# Verification & Testing

The processor was progressively verified using:
- arithmetic test programs
- ALU operation validation
- memory access verification
- load/store testing
- branch and jump testing
- signed and unsigned comparison tests
- loop-based execution programs

Waveform simulations were used to verify:
- control signals
- ALU outputs
- memory operations
- branch conditions
- datapath correctness
- register updates

Finally, a factorial program was successfully executed on FPGA to validate:
- datapath operation
- branch handling
- jump execution
- memory access
- register writeback
- ALU functionality

The successful execution confirmed stable processor behavior across multiple instruction types and control-flow operations.

---

# Tools Used

- Verilog HDL
- Xilinx Vivado Design Suite
- RV32I ISA
- Digilent Basys3 FPGA Board
- AMD/Xilinx Artix-7 FPGA

---

# Result

The project successfully demonstrates a fully functional 32-bit RV32I single-cycle RISC-V processor capable of executing arithmetic, logical, memory, branch, jump, and loop-based programs on FPGA hardware.

The processor successfully supports:
- arithmetic and logical instructions
- signed and unsigned operations
- byte/halfword/word memory access
- branch and jump instructions
- upper immediate instructions
- FPGA-based execution and verification

The successful FPGA execution of the factorial program confirmed correct end-to-end processor functionality and stable execution of multiple RV32I instruction types.
