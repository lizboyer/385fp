set_global_assignment -entity "lab71_2" -library "lib_lab71_2" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "lab71_2" -library "lib_lab71_2" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "lab71_2" -library "lib_lab71_2" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_lab71_2" -name SPD_FILE [file join $::quartus(sip_path) "../lab71_2.spd"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "../../lab71_2.qsys"]

set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "lab71_2.vhd"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "lab71_2_rst_controller.vhd"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "lab71_2_rst_controller_001.vhd"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.v"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_synchronizer.v"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.sdc"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_irq_mapper.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_mm_interconnect_0.v"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_mm_interconnect_0_avalon_st_adapter_005.vhd"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_mm_interconnect_0_avalon_st_adapter_005_error_adapter_0.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_mm_interconnect_0_avalon_st_adapter.vhd"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_avalon_st_handshake_clock_crosser.v"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_avalon_st_clock_crosser.v"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_avalon_st_pipeline_base.v"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_std_synchronizer_nocut.v"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_avalon_st_handshake_clock_crosser.sdc"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_width_adapter.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_address_alignment.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_burst_uncompressor.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_mm_interconnect_0_rsp_mux.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_arbitrator.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_mm_interconnect_0_rsp_demux.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_mm_interconnect_0_cmd_mux.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_mm_interconnect_0_cmd_demux.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_burst_adapter.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_burst_adapter_uncmpr.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_burst_adapter_13_1.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_burst_adapter_new.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_incr_burst_converter.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_wrap_burst_converter.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_default_burst_converter.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_avalon_st_pipeline_stage.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_mm_interconnect_0_router_007.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_mm_interconnect_0_router_002.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_mm_interconnect_0_router.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_avalon_sc_fifo.v"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_slave_agent.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_master_agent.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_slave_translator.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_master_translator.sv"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_usb_rst.vhd"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_usb_gpx.vhd"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_timer_0.vhd"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_sysid_qsys_0.v"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_spi_0.vhd"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_sdram_pll.vho"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_sdram.vhd"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0.v"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0_cpu.sdc"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0_cpu.v"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0_cpu_debug_slave_sysclk.v"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0_cpu_debug_slave_tck.v"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0_cpu_debug_slave_wrapper.v"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0_cpu_nios2_waves.do"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0_cpu_ociram_default_contents.dat"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0_cpu_ociram_default_contents.hex"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0_cpu_ociram_default_contents.mif"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0_cpu_rf_ram_a.dat"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0_cpu_rf_ram_a.hex"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0_cpu_rf_ram_a.mif"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0_cpu_rf_ram_b.dat"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0_cpu_rf_ram_b.hex"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0_cpu_rf_ram_b.mif"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_nios2_gen2_0_cpu_test_bench.v"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_leds_pio.vhd"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_keycode.vhd"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_key.vhd"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_jtag_uart_0.vhd"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/lab71_2_hex_digits_pio.vhd"]
set_global_assignment -library "lib_lab71_2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/finalproject.sv"]
