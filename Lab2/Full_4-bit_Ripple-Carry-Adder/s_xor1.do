#run this file to simulate the RC adder

# close any existing simulations
quit -sim

# compile our VHDL file
vcom FullRCAdder2.vhd

# start the simulation - set timescale to nanoseconds
vsim -t ns Adder4

# add the inputs to the wave
# first add a divider with a label
add wave -divider Inputs:
add wave A B Cin

# add the outputs to the wave
# first add a divider with a label
add wave -divider Outputs:
add wave S Cout C

# do initial run with default values - optional
# run 10 ns

# force values
force a "1111"
force b "0001"
force cin 0

# run
run 100 ns
