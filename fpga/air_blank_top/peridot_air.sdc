# ------------------------------------------
# Create generated clocks based on PLLs
# ------------------------------------------

derive_pll_clocks
derive_clock_uncertainty


# ---------------------------------------------
# Original Clock
# ---------------------------------------------

create_clock -period "50.000 MHz" [get_ports CLOCK_50]


# ---------------------------------------------
# Set SDRAM I/O requirements
# ---------------------------------------------

set sdrclk_period	10.0
set sdrclk_iodelay	3.154
set sdram_tsu		1.5
set sdram_th		1.0
set sdram_tco_cl3	5.4
set sdram_tco_cl2	6.0
set sdram_tco		$sdram_tco_cl2

create_clock -name sdram_clock -period $sdrclk_period
set_output_delay -clock sdram_clock -max [expr $sdram_tsu] [get_ports {SDR_*}]
set_output_delay -clock sdram_clock -min [expr -$sdram_th] [get_ports {SDR_*}]
set_input_delay -clock sdram_clock -max [expr $sdram_tco] [get_ports {SDR_DQ[*]}]
set_input_delay -clock sdram_clock -min 0 [get_ports {SDR_DQ[*]}]


# ---------------------------------------------
# Set false path
# ---------------------------------------------


