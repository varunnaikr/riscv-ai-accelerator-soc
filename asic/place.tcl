read_lef /work/pdk/lef/sky130_fd_sc_hd__nom.tlef
read_lef /work/pdk/lef/sky130_fd_sc_hd.lef
read_liberty /work/pdk/sky130_fd_sc_hd__tt_025C_1v80.lib

read_def /work/asic/accelerator_floorplan.def

global_placement

write_def /work/asic/accelerator_placed.def
exit
