#run this file to simulate the CLA adder

# close any existing simulations
quit -sim

# compile our VHDL file
vcom claFullAdder.vhd

# start the simulation - set timescale to nanoseconds
vsim -t ns CLA

# add the inputs to the wave
# first add a divider with a label
add wave -divider Inputs:
add wave A B Cin

# add the outputs to the wave
# first add a divider with a label
add wave -divider Outputs:
add wave S Cout C1 C2 C3

# do initial run with default values - optional
# run 10 ns

# force values
force a "1111"
force b "0001"
force cin 0

# run
run 100 ns
