# 32_Bit_RISCV_SingleCycle
# RV32I Single-Cycle RISC-V Processor

This project is a custom 32-bit RV32I RISC-V processor designed and implemented in Verilog HDL.  
The processor follows a single-cycle architecture and was developed to understand the complete datapath and control flow of a modern instruction set architecture.

The design includes:
- Instruction fetch and decode
- Register file
- ALU with signed and unsigned operations
- Immediate generation
- Branch and jump control logic
- Load/store memory subsystem
- FPGA integration and hardware verification

The processor supports arithmetic, logical, memory, branch, and jump instructions from the RV32I base instruction set.

The design was successfully synthesized and tested on FPGA, where a factorial program was executed correctly to verify functionality of:
- loops
- branching
- arithmetic operations
- memory access
- jump instructions

---

# Supported RV32I Instructions

## R-Type Instructions
- add
- sub
- and
- or
- xor
- sll
- srl
- sra
- slt
- sltu

## I-Type Instructions
- addi
- andi
- ori
- xori
- slti
- sltiu
- slli
- srli
- srai

## Load Instructions
- lb
- lh
- lw
- lbu
- lhu

## Store Instructions
- sb
- sh
- sw

## Branch Instructions
- beq
- bne
- blt
- bge
- bltu
- bgeu

## Jump Instructions
- jal
- jalr

## Upper Immediate Instructions
- lui
- auipc

---
