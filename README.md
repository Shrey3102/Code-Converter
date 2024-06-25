# 8-bit Binary to Gray Code Converter and Vice-Versa

## Project Overview

This project involves designing an architecture to convert an 8-bit binary number to an 8-bit Gray code number and vice versa. The design uses two main modules: `CC` for the conversion process and `CS` as a control unit to manage the conversion process. The design includes a test bench to verify the functionality of the modules.

## Project Structure

- `CC.v`: This module handles the actual conversion between binary and Gray code.
- `CS.v`: This control unit module manages the state machine and controls the conversion process.
- `TestBench.v`: A test bench to simulate and verify the functionality of the `CC` and `CS` modules.
- `README.md`: This file.

## Modules

### CC (Conversion Core)

This module converts an 8-bit binary number to an 8-bit Gray code number.

#### Ports:
- `input [7:0] R1`: 8-bit binary input.
- `output reg [7:0] R2`: 8-bit Gray code output.

#### Description:
- The MSB of the Gray code is the same as the MSB of the binary code.
- Each bit of the Gray code (except the MSB) is the XOR of the corresponding binary bit and the next higher-order bit.

### CS (Control Unit)

This module manages the state machine and controls the conversion process.

#### Ports:
- `input start`: Signal to start the conversion process.
- `input convert`: Signal to select conversion direction (binary to Gray or Gray to binary).
- `input clk`: Clock signal.
- `output reg R1_in`: Control signal for R1 input.
- `output reg R2_in`: Control signal for R2 input.
- `output reg R1_out`: Control signal for R1 output.
- `output reg R2_out`: Control signal for R2 output.
- `output reg R3_in`: Control signal for R3 input.
- `output reg R4_in`: Control signal for R4 input.
- `output reg R3_out`: Control signal for R3 output.
- `output reg R4_out`: Control signal for R4 output.
- `output reg done`: Signal indicating completion of the conversion process.

### Test Bench

The test bench simulates the binary-to-Gray code conversion process. It initializes inputs, applies stimulus to the circuit, and observes the outputs to verify correct functionality.

## How to Run

1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/binary-gray-converter.git
   cd binary-gray-converter
