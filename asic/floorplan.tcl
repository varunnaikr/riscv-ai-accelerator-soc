read_lef /work/pdk/lef/sky130_fd_sc_hd__nom.tlef
read_lef /work/pdk/lef/sky130_fd_sc_hd.lef
read_liberty /work/pdk/sky130_fd_sc_hd__tt_025C_1v80.lib

read_verilog /work/build/asic/accelerator_top_sky130.v
link_design accelerator_top

initialize_floorplan \
  -site unithd \
  -utilization 60 \
  -aspect_ratio 1.0 \
  -core_space 20

make_tracks

place_pins \
  -hor_layers met3 \
  -ver_layers met2

write_def /work/asic/accelerator_floorplan.def
exit
