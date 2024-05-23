# FPGA Count Project

## Overview

This project demonstrates a basic FPGA design that counts and displays values on a 7-segment display. The design includes a debounce mechanism (using FSM) for button input, a counter to increment the value, and a 7-segment display driver.

## Design Details

### Entities

1. **debounce_fsm**
2. **adder**
3. **hex_seven**
4. **click_7seg (Top Entity)**

### debounce_fsm

This module debounces a button input to ensure reliable counting.

### adder

This module increments the count on a button press and resets after reaching a specific value.

### hex_seven

This module drives a 7-segment display based on the input hex value.

### click_7seg (Top Entity)

This is the top-level entity that integrates the debounce, adder, and hex_seven modules.

## Testbenches

Each entity has an associated testbench to verify its functionality:
- `debounce_fsm_tb.vhd`
- `adder_tb.vhd`
- `hex_seven_tb.vhd`
- `click_7seg_tb.vhd`

## Tools and Hardware

- **FPGA Board**: Basys 3
- **Design Suite**: Xilinx Vivado

## Getting Started

### Prerequisites

- Xilinx Vivado Design Suite
- Basys 3 FPGA Board

### Setup

1. Clone this repository:
    ```bash
    git clone https://github.com/yourusername/count_project.git
    ```

2. Open Vivado and create a new project.

3. Add the VHDL files to your project:
    - `debounce_fsm.vhd`
    - `adder.vhd`
    - `hex_seven.vhd`
    - `click_7seg.vhd`

4. Set `click_7seg` as the top module.

5. Synthesize, implement, and generate the bitstream.

6. Program the FPGA.

## Usage

- The FPGA will start counting on a 7-segment display upon a button press.
- The count will increment on each press and reset after reaching the maximum count.

