read_lef /work/pdk/lef/sky130_fd_sc_hd__nom.tlef
read_lef /work/pdk/lef/sky130_fd_sc_hd.lef
read_liberty /work/pdk/sky130_fd_sc_hd__tt_025C_1v80.lib

read_def /work/asic/accelerator_placed.def

create_clock -name clk -period 10 [get_ports clk]

clock_tree_synthesis

write_def /work/asic/accelerator_cts.def
exit
