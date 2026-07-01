# Single-Cycle RISC-V Processor

This repository contains a **single-cycle RISC-V processor** implemented in **SystemVerilog**. The project is developed for computer architecture learning and focuses on building the main datapath and control logic of a 32-bit RISC-V CPU.

The processor follows a single-cycle execution model, where each instruction is fetched, decoded, executed, and written back within one clock cycle.

---

## 1. Project Overview

The goal of this project is to design and verify a basic 32-bit RISC-V processor using hardware description language. The design includes the main components of a processor such as the Program Counter, Instruction Memory, Register File, ALU, Control Unit, Immediate Generator, Branch Comparator, Load-Store Unit, and Data Memory.

The processor uses a Harvard-like memory structure, where instruction memory and data memory are separated.

---

## 2. Main Features

* 32-bit single-cycle RISC-V processor.
* Written in SystemVerilog.
* Separate instruction memory and data memory.
* Supports arithmetic, logic, memory access, branch, and jump instructions.
* Includes memory-mapped I/O for switches and LEDs.
* Includes simulation testbench, driver, and scoreboard.
* Supports waveform debugging using SimVision.

---

## 3. Supported Instruction Types

The processor supports the main RV32I instruction formats:

| Instruction Type | Description                                         |
| ---------------- | --------------------------------------------------- |
| R-type           | Register-register arithmetic and logic instructions |
| I-type           | Immediate arithmetic and logic instructions         |
| Load-type        | Load data from memory                               |
| S-type           | Store data to memory                                |
| B-type           | Conditional branch instructions                     |
| J-type           | Jump instructions                                   |
| U-type           | Upper immediate instructions                        |
| JALR             | Indirect jump instruction                           |

Examples of supported operations include:

* ADD
* SUB
* SLL
* SLT
* SLTU
* XOR
* SRL
* SRA
* OR
* AND
* LUI
* AUIPC
* BEQ
* BNE
* BLT
* BGE
* BLTU
* BGEU
* JAL
* JALR
* Load and store instructions

---

## 4. Processor Architecture

The processor is built from the following main blocks:

```text
+----------------+
| Program Counter|
+----------------+
        |
        v
+----------------+
| Instruction Mem|
+----------------+
        |
        v
+----------------+
|  Control Unit  |
+----------------+
        |
        v
+----------------+       +----------------+
|  Register File | ----> |      ALU       |
+----------------+       +----------------+
        |                       |
        v                       v
+----------------+       +----------------+
| Immediate Gen  |       | Load Store Unit|
+----------------+       +----------------+
                                |
                                v
                        +----------------+
                        |  Data Memory   |
                        +----------------+
```

The top-level module connects the datapath and control path together. It fetches instructions from instruction memory, decodes the instruction, reads operands from the register file, performs ALU operations, accesses memory when required, and writes the result back to the register file.

---

## 5. Main Modules

### `single_cycle.sv`

This is the top-level processor module. It connects all major components of the CPU, including:

* Program Counter
* Instruction Memory
* Register File
* Immediate Generator
* Control Unit
* Branch Comparator
* ALU
* Load-Store Unit
* Write-back Mux

Main I/O ports include:

* `i_clk`
* `i_reset`
* `i_io_sw`
* `o_io_ledr`
* `o_io_ledg`
* `o_io_lcd`
* `o_io_hex0` to `o_io_hex7`
* `o_pc_debug`
* `o_insn_vld`

---

### `allmodule.sv`

This file contains the main internal modules used by the processor, including:

* `alu`
* `control`
* `alu_control`
* `BRC`
* `imem`
* `immgen`
* `lsu`
* `memory`
* `regfile`
* `pc_reg`
* `pc_plus4`
* `mux2_1`
* `mux4to1`
* `mux16_1`
* `mux32_1`
* adder and comparator modules

---

### `imem`

The instruction memory stores the program instructions loaded from a hex file.

The design note specifies that the instruction memory should have at least 8 kB capacity to run the ISA test programs.

---

### `lsu`

The Load-Store Unit handles memory access instructions and memory-mapped I/O. It supports reading and writing data memory, as well as connecting the processor to external I/O such as switches and LEDs.

---

### `regfile`

The register file contains 32 general-purpose 32-bit registers. Register `x0` is hardwired to zero, following the RISC-V specification.

---

## 6. Repository Structure

```text
computer-architecture-risc_v/
│
├── 00_src/
│   ├── allmodule.sv
│   └── single_cycle.sv
│
├── 01_bench/
│   ├── tbench.sv
│   ├── driver.sv
│   ├── scoreboard.sv
│   └── tlib.svh
│
├── 02_test/
│   ├── isa_1b.hex
│   └── isa_4b.hex
│
├── 03_sim/
│   └── makefile
│
├── L02_NHOM17_MILESTONE2.pdf
└── milestone-2.pdf
```

---

## 7. Simulation Environment

The project uses **Cadence Xcelium** for simulation.

The simulation flow is managed using the makefile located in the `03_sim` directory.

### Create File List

```bash
cd 03_sim
make create_filelist
```

This command automatically creates the simulation file list by collecting source files from `00_src` and testbench files from `01_bench`.

### Run Simulation

```bash
make sim
```

This command runs the simulation using `xrun`.

### Open Waveform

```bash
make wave
```

This command opens the generated waveform database using SimVision.

### Run GUI Simulation

```bash
make gui
```

This command runs the simulation in GUI mode.

### Clean Simulation Files

```bash
make clean
```

This command removes generated simulation files.

---

## 8. Testbench Description

The testbench includes:

* Clock generator
* Active-low reset generator
* Timeout control
* Waveform dumping
* Driver module
* Scoreboard module

The driver provides input switch data to the processor. The scoreboard monitors the processor output and prints test messages during simulation.

The testbench uses the following default configuration:

```systemverilog
`define RESET_PERIOD 100
`define CLK_PERIOD   2
`define FINISH       40_000
```

---

## 9. Program Loading

The instruction memory loads the test program from the `02_test` directory.

By default, the instruction memory reads:

```systemverilog
$readmemh("./../02_test/isa_4b.hex", mem);
```

To run another test program, modify the hex file path inside the instruction memory module.

---

## 10. Verification Result

The processor is verified using the provided ISA test program. During simulation, the scoreboard monitors the program counter and output signals to display the test result.

Expected simulation messages include:

```text
SINGLE CYCLE - ISA test
END of ISA test
```

Waveform data is dumped into:

```text
wave.shm
```

This file can be opened using SimVision for debugging and signal analysis.

---

## 11. Tools Used

* SystemVerilog
* Cadence Xcelium
* SimVision
* Makefile-based simulation flow

---

## 12. Learning Outcomes

Through this project, the following computer architecture and digital design concepts are practiced:

* RISC-V instruction decoding
* Single-cycle processor datapath design
* Control unit design
* Register file implementation
* ALU design
* Branch comparison logic
* Load-store operation
* Memory-mapped I/O
* SystemVerilog simulation and verification

---

## 13. Notes

This project is intended for educational purposes in computer architecture and digital system design. It demonstrates how a basic single-cycle RISC-V processor can be built from fundamental hardware modules and verified through simulation.
