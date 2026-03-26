# 🚀 RISC-V 32-bit Single Cycle Processor

## 📌 Overview
This project implements a **32-bit Single Cycle Processor** based on the **RISC-V Instruction Set Architecture (ISA)** using Verilog HDL.  
Each instruction is executed in a **single clock cycle**, making the design simple and ideal for understanding CPU architecture and datapath design.

---

## 🎯 Features
- 32-bit RISC-V single-cycle architecture  
- Executes one instruction per clock cycle  
- Modular Verilog design  
- Functional datapath and control unit  
- ALU supporting arithmetic and logical operations  
- Register file with read/write capability  
- Separate instruction and data memory  

---

## 🧠 Supported Instructions

### ✅ R-Type
- ADD  
- SUB  
- AND  
- OR  

### ✅ I-Type
- ADDI  
- LW (Load Word)  

### ✅ S-Type
- SW (Store Word)  

### ✅ B-Type
- BEQ (Branch if Equal)  

---

## 🏗️ Architecture

The processor consists of the following components:

- **Program Counter (PC)** – Holds the address of the current instruction  
- **Instruction Memory** – Stores program instructions  
- **Register File** – Stores register values  
- **ALU (Arithmetic Logic Unit)** – Performs arithmetic and logic operations  
- **Control Unit** – Generates control signals based on instruction type  
- **Data Memory** – Handles load/store operations  
- **Immediate Generator (Extend Unit)** – Generates immediate values  
- **Multiplexers & Adders** – Used for datapath control  

---

## 📊 Architecture Diagram
<img width="1012" height="547" alt="image" src="https://github.com/user-attachments/assets/d00b22cb-3e0c-4e73-9998-3d9117a345f6" />

---

## ⚙️ Working Principle
1. Fetch instruction from instruction memory using PC  
2. Decode instruction in control unit  
3. Read operands from register file  
4. Execute operation using ALU  
5. Access data memory (for load/store instructions)  
6. Write result back to register  
7. Update PC for next instruction  

---

## 🧪 Simulation Waveform
<img width="1450" height="880" alt="image" src="https://github.com/user-attachments/assets/7c962b9e-0685-4e0f-aa9f-e986652a374e" />




### 🔧 Steps to Run

```bash
# Clone the repository
git clone https://github.com/your-username/RISCV-32-bit-Single-Cycle-Processor.git

# Navigate to project folder
cd RISCV-32-bit-Single-Cycle-Processor
