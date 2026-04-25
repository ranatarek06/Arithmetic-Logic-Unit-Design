Arithmetic Logic Unit (ALU) Design in Verilog
This project implements an Arithmetic Logic Unit (ALU) capable of performing operations on signed 3-bit inputs. The design supports multiple arithmetic operations and generates status flags to describe the result.

Features
- Addition and subtraction of signed numbers
- Multiplication with extended bit-width output
- Remainder operation with divide-by-zero handling
- Status flags:
  - Sign Flag (SF)
  - Zero Flag (ZF)
  - Divide-by-Zero Flag (DZF)
  - Even Flag (EF)
  - Odd Flag (OF)

Design Details
- Inputs: Two 3-bit signed numbers (A, B)
- Operation Mode: Determines the operation performed
- Output: Result displayed using 7-segment representation
- Modular design using separate Verilog files for each operation

Implementation
- Designed using Verilog HDL
- Modular architecture (ALU, add/sub, multiplication, remainder)
- Integrated using a top-level ALU module
- Tested using comprehensive testbenches covering all input combinations [-3 to 3]

Tools Used
- Verilog HDL
- Simulation tools (e.g., ModelSim)

What I Learned
- Digital system design and modular architecture
- Working with signed binary numbers
- Writing and testing Verilog modules
- Handling edge cases such as division by zero
- Hardware-software integration concepts

- Expand bit-width for higher precision
- Add more operations (AND, OR, XOR)
- Optimize performance and hardware usage
