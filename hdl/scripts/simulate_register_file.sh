#!/bin/bash

# Project name
DESIGN_FILE="../core/register_file.vhd"
TB_FILE="../tb/register_file_tb.vhd"
OUTPUT="register_file_tb"
VCD_FILE="${OUTPUT}.vcd"
STOP_TIME="1000ns"  # Simulation time

# Clean previously generated files
echo "Cleaning previous files..."
rm -f *.o *.cf ${VCD_FILE} ${OUTPUT}

# Compile the design
echo "Compiling the design..."
ghdl -a -fexplicit -fsynopsys ${DESIGN_FILE}
if [ $? -ne 0 ]; then
    echo "Error: Failed to compile ${DESIGN_FILE}"
    exit 1
fi

# Compile the test bench
echo "Compiling the test bench..."
ghdl -a ${TB_FILE}
if [ $? -ne 0 ]; then
    echo "Error: Failed to compile ${TB_FILE}"
    exit 1
fi

# Elaborate the test bench
echo "Elaborating the test bench..."
ghdl -e ${OUTPUT}
if [ $? -ne 0 ]; then
    echo "Error: Failed to elaborate ${OUTPUT}"
    exit 1
fi

# Run the simulation
echo "Running the simulation..."
ghdl -r ${OUTPUT} --vcd=${VCD_FILE} --stop-time=${STOP_TIME}
if [ $? -ne 0 ]; then
    echo "Error: Simulation failed"
    exit 1
fi

# Verify that the VCD file was created
if [ -f ${VCD_FILE} ]; then
    echo "Simulation complete. Opening GTKWave to view the waveforms..."
    gtkwave ${VCD_FILE}
else
    echo "Error: The VCD file was not generated"
    exit 1
fi
