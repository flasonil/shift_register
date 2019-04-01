# shift_register

8 bits shift register with asynchronous reset, parallel and serial I/O.

 CTRL = 00 --> no shift
 
 CTRL = 01 --> shift left
 
 CTRL = 10 --> shift right
 
 CTRL = 11 --> update
 

Commands to compile and run simulation on ModelSim SE-64 10.5
>vlog -sw -work work -quiet shift_register.sv

>vlog -sw -work work -quiet testbench.sv

>vsim testbench -novopt
