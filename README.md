# RISC-V Single Cycle Processor

This repository contains the design and implementation of a RISC-V single cycle processor using Verilog. The processor supports a subset of the RISC-V instruction set architecture and is designed for educational purposes.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Architecture](#architecture)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Introduction
The RISC-V single cycle processor project aims to demonstrate the design and functionality of a simple, single-cycle implementation of the RISC-V CPU. This project is suitable for those interested in computer architecture, digital design, and hardware implementation.

## Features
- Implements a subset of the RISC-V ISA
- Single cycle design
- Written in SystemVerilog
- Basic ALU operations
- Instruction fetch, decode, execute, and write-back stages

## Architecture
The processor is divided into several key modules:
- **Instruction Fetch (IF)**: Fetches instructions from memory.
- **Instruction Decode (ID)**: Decodes the fetched instruction.
- **Execute (EX)**: Performs arithmetic and logic operations.
- **Memory Access (MEM)**: Handles data memory operations.
- **Write-back (WB)**: Writes results back to the register file.

![Processor Architecture Diagram](F:\single-cycle-processor)

## Getting Started

### Prerequisites
To simulate and test the processor, you will need:
- Verilog simulator (e.g., ModelSim, Icarus Verilog)
- Basic knowledge of Verilog and digital design

### Installation
1. Clone the repository
   ```sh
   git clone https://github.com//riscv-single-cycle-processor.git
