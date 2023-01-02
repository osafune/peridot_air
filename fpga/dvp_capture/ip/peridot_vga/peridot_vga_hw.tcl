# ===================================================================
# TITLE : PERIDOT peripherals / "PERIDOT VGA Controller"
#
#   DEGISN : S.OSAFUNE (J-7SYSTEM WORKS LIMITED)
#   DATE   : 2023/01/01 -> 2023/01/02
#   MODIFY : 
#
# ===================================================================
#
# The MIT License (MIT)
# Copyright (c) 2023 J-7SYSTEM WORKS LIMITED.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module peridot_vga_controller
# 
set_module_property NAME peridot_vga_controller
set_module_property DISPLAY_NAME "PERIDOT VGA controller"
set_module_property DESCRIPTION "PERIDOT VGA controller"
set_module_property GROUP "PERIDOT Peripherals"
set_module_property AUTHOR "J-7SYSTEM WORKS LIMITED"
set_module_property VERSION 20.1
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property HIDE_FROM_SOPC true
set_module_property HIDE_FROM_QUARTUS true
set_module_property EDITABLE false
set_module_property ELABORATION_CALLBACK elaboration_callback
#set_module_property SUPPORTED_DEVICE_FAMILIES {"MAX 10" "Cyclone 10 LP" "Cyclone IV E" "Cyclone IV GX" "Cyclone V"}


# 
# file sets
# 
add_fileset quartus_synth QUARTUS_SYNTH generate_synth
set_fileset_property QUARTUS_SYNTH TOP_LEVEL peridot_vga


# 
# parameters
# 
set debugview false
set pcmaudio true

add_parameter DEVICE_FAMILY string
set_parameter_property DEVICE_FAMILY HDL_PARAMETER true
set_parameter_property DEVICE_FAMILY SYSTEM_INFO {DEVICE_FAMILY}
set_parameter_property DEVICE_FAMILY VISIBLE $debugview
add_parameter PART_NAME string
set_parameter_property PART_NAME SYSTEM_INFO {DEVICE}
set_parameter_property PART_NAME ENABLED false
set_parameter_property PART_NAME VISIBLE $debugview

add_parameter BURSTLENGTH_WIDTH integer
set_parameter_property BURSTLENGTH_WIDTH HDL_PARAMETER true
set_parameter_property BURSTLENGTH_WIDTH DERIVED true
set_parameter_property BURSTLENGTH_WIDTH VISIBLE $debugview
add_parameter VGACLOCK_FREQUENCY integer 
set_parameter_property VGACLOCK_FREQUENCY HDL_PARAMETER true
set_parameter_property VGACLOCK_FREQUENCY DERIVED true
set_parameter_property VGACLOCK_FREQUENCY VISIBLE $debugview
add_parameter H_TOTAL integer
set_parameter_property H_TOTAL HDL_PARAMETER true
set_parameter_property H_TOTAL DERIVED true
set_parameter_property H_TOTAL VISIBLE $debugview
add_parameter H_SYNC integer
set_parameter_property H_SYNC HDL_PARAMETER true
set_parameter_property H_SYNC DERIVED true
set_parameter_property H_SYNC VISIBLE $debugview
add_parameter H_BACKP integer
set_parameter_property H_BACKP HDL_PARAMETER true
set_parameter_property H_BACKP DERIVED true
set_parameter_property H_BACKP VISIBLE $debugview
add_parameter H_ACTIVE integer
set_parameter_property H_ACTIVE HDL_PARAMETER true
set_parameter_property H_ACTIVE DERIVED true
set_parameter_property H_ACTIVE VISIBLE $debugview
add_parameter V_TOTAL integer
set_parameter_property V_TOTAL HDL_PARAMETER true
set_parameter_property V_TOTAL DERIVED true
set_parameter_property V_TOTAL VISIBLE $debugview
add_parameter V_SYNC integer
set_parameter_property V_SYNC HDL_PARAMETER true
set_parameter_property V_SYNC DERIVED true
set_parameter_property V_SYNC VISIBLE $debugview
add_parameter V_BACKP integer
set_parameter_property V_BACKP HDL_PARAMETER true
set_parameter_property V_BACKP DERIVED true
set_parameter_property V_BACKP VISIBLE $debugview
add_parameter V_ACTIVE integer
set_parameter_property V_ACTIVE HDL_PARAMETER true
set_parameter_property V_ACTIVE DERIVED true
set_parameter_property V_ACTIVE VISIBLE $debugview
add_parameter USE_AUDIOSTREAM string
set_parameter_property USE_AUDIOSTREAM HDL_PARAMETER true
set_parameter_property USE_AUDIOSTREAM DERIVED true
set_parameter_property USE_AUDIOSTREAM VISIBLE $debugview

add_parameter VIDEO_INTERFACE string "PARALLEL"
set_parameter_property VIDEO_INTERFACE HDL_PARAMETER true
set_parameter_property VIDEO_INTERFACE DISPLAY_NAME "Video output interface"
set_parameter_property VIDEO_INTERFACE ALLOWED_RANGES {"PARALLEL:Parallel" "DVI:DVI" "LITEHDMI:Lite HDMI" "HDMI:HDMI"}

add_parameter PIXEL_COLORORDER string "RGB565"
set_parameter_property PIXEL_COLORORDER HDL_PARAMETER true
set_parameter_property PIXEL_COLORORDER DISPLAY_NAME "Pixel color format"
set_parameter_property PIXEL_COLORORDER ALLOWED_RANGES {"RGB565" "RGB555" "YUV422"}

add_parameter PIXEL_DATAORDER string "BYTE"
set_parameter_property PIXEL_DATAORDER HDL_PARAMETER true
set_parameter_property PIXEL_DATAORDER DISPLAY_NAME "Alignment unit of pixel data"
set_parameter_property PIXEL_DATAORDER ALLOWED_RANGES {"BYTE:Byte(8bit)" "WORD:Word(16bit)"}
set_parameter_property PIXEL_DATAORDER DISPLAY_HINT radio

add_parameter LINEOFFSETBYTES integer 2048
set_parameter_property LINEOFFSETBYTES HDL_PARAMETER true
set_parameter_property LINEOFFSETBYTES DISPLAY_NAME "Data bytes per line"
set_parameter_property LINEOFFSETBYTES UNITS Bytes

add_parameter DOTCLOCK_FREQUENCY float 25.2
set_parameter_property DOTCLOCK_FREQUENCY DISPLAY_NAME "Video clock frequency"
set_parameter_property DOTCLOCK_FREQUENCY UNITS Megahertz

add_parameter SUPPORT_RESOLUTION integer 0
set_parameter_property SUPPORT_RESOLUTION DISPLAY_NAME "Video resolution"
set_parameter_property SUPPORT_RESOLUTION ALLOWED_RANGES {"0:VGA (640x480)" "1:WVGA (800x480)" "2:SVGA (800x600)" "3:XGA (1024x768)" "4:WXGA (1366x768)" "5:SXGA (1280x1024)" "6:SD480p (720x480)" "7:HD720p (1280x720)" "99:Custom"}

add_parameter VIDEO_HTOTAL integer 525
set_parameter_property VIDEO_HTOTAL DISPLAY_NAME "Horizontal total"
set_parameter_property VIDEO_HTOTAL DISPLAY_UNITS "pixel (8-4096)"
set_parameter_property VIDEO_HTOTAL ALLOWED_RANGES 8:4096
add_parameter VIDEO_HSYNC integer 40
set_parameter_property VIDEO_HSYNC DISPLAY_NAME "Horizontal sync width"
set_parameter_property VIDEO_HSYNC DISPLAY_UNITS "pixel (1-512)"
set_parameter_property VIDEO_HSYNC ALLOWED_RANGES 1:512
add_parameter VIDEO_HBACKP integer 0
set_parameter_property VIDEO_HBACKP DISPLAY_NAME "Horizontal back porch"
set_parameter_property VIDEO_HBACKP DISPLAY_UNITS "pixel (0-2048)"
set_parameter_property VIDEO_HBACKP ALLOWED_RANGES 0:2048
add_parameter VIDEO_HACTIVE integer 480
set_parameter_property VIDEO_HACTIVE DISPLAY_NAME "Horizontal active"
set_parameter_property VIDEO_HACTIVE DISPLAY_UNITS "pixel (8-4096)"
set_parameter_property VIDEO_HACTIVE ALLOWED_RANGES 8:4096
add_parameter VIDEO_VTOTAL integer 288
set_parameter_property VIDEO_VTOTAL DISPLAY_NAME "Vertical total"
set_parameter_property VIDEO_VTOTAL DISPLAY_UNITS "line (4-4096)"
set_parameter_property VIDEO_VTOTAL ALLOWED_RANGES 4:4096
add_parameter VIDEO_VSYNC integer 3
set_parameter_property VIDEO_VSYNC DISPLAY_NAME "Vertical sync width"
set_parameter_property VIDEO_VSYNC DISPLAY_UNITS "line (1-512)"
set_parameter_property VIDEO_VSYNC ALLOWED_RANGES 1:512
add_parameter VIDEO_VBACKP integer 0
set_parameter_property VIDEO_VBACKP DISPLAY_NAME "Vertical back porch"
set_parameter_property VIDEO_VBACKP DISPLAY_UNITS "line (0-2048)"
set_parameter_property VIDEO_VBACKP ALLOWED_RANGES 0:2048
add_parameter VIDEO_VACTIVE integer 272
set_parameter_property VIDEO_VACTIVE DISPLAY_NAME "Vertical active"
set_parameter_property VIDEO_VACTIVE DISPLAY_UNITS "line (1-4096)"
set_parameter_property VIDEO_VACTIVE ALLOWED_RANGES 1:4096

add_parameter SUPPORT_AUDIOSTREAM integer 0
set_parameter_property SUPPORT_AUDIOSTREAM DISPLAY_NAME "Use PCM audio stream"
set_parameter_property SUPPORT_AUDIOSTREAM DISPLAY_HINT boolean
set_parameter_property SUPPORT_AUDIOSTREAM VISIBLE $pcmaudio

add_parameter PCMSAMPLE_FREQUENCY integer 44100
set_parameter_property PCMSAMPLE_FREQUENCY HDL_PARAMETER true
set_parameter_property PCMSAMPLE_FREQUENCY DISPLAY_NAME "PCM sampling frequency"
set_parameter_property PCMSAMPLE_FREQUENCY ALLOWED_RANGES {"32000:32KHz" "44100:44.1KHz" "48000:48KHz" "88200:88.2KHz" "96000:96KHz" "176400:176.4KHz" "192000:192KHz"}
set_parameter_property PCMSAMPLE_FREQUENCY VISIBLE $pcmaudio


# 
# display items
# 


#-----------------------------------
# Clock and Reset interface
#-----------------------------------
# 
# connection point csr_clk
# 
add_interface csr_clk clock sink
set_interface_property csr_clk clockRate 0

add_interface_port csr_clk csi_csr_clk clk Input 1

# 
# connection point reset
# 
add_interface reset reset sink
set_interface_property reset associatedClock csr_clk
set_interface_property reset synchronousEdges DEASSERT

add_interface_port reset csi_csr_reset reset Input 1


#-----------------------------------
# Avalon-MM agent interface
#-----------------------------------
# 
# connection point csr
# 
add_interface csr avalon slave
set_interface_property csr addressAlignment NATIVE
set_interface_property csr addressUnits WORDS
set_interface_property csr associatedClock csr_clk
set_interface_property csr associatedReset reset
set_interface_property csr bitsPerSymbol 8
set_interface_property csr burstOnBurstBoundariesOnly false
set_interface_property csr burstcountUnits WORDS
set_interface_property csr explicitAddressSpan 0
set_interface_property csr holdTime 0
set_interface_property csr linewrapBursts false
set_interface_property csr maximumPendingReadTransactions 0
set_interface_property csr readLatency 0
set_interface_property csr readWaitTime 1
set_interface_property csr setupTime 0
set_interface_property csr timingUnits Cycles
set_interface_property csr writeWaitTime 0
set_interface_assignment csr embeddedsw.configuration.isFlash 0
set_interface_assignment csr embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment csr embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment csr embeddedsw.configuration.isPrintableDevice 0

add_interface_port csr avs_csr_address address Input 2
add_interface_port csr avs_csr_read read Input 1
add_interface_port csr avs_csr_readdata readdata Output 32
add_interface_port csr avs_csr_write write Input 1
add_interface_port csr avs_csr_writedata writedata Input 32

# 
# connection point irq_s1
# 
add_interface irq_csr interrupt end
set_interface_property irq_csr associatedAddressablePoint csr
set_interface_property irq_csr associatedClock csr_clk
set_interface_property irq_csr associatedReset reset

add_interface_port irq_csr ins_csr_irq irq Output 1


#-----------------------------------
# Avalon-MM host interface
#-----------------------------------
# 
# connection point m1_clk
# 
add_interface m1_clk clock sink
set_interface_property m1_clk clockRate 0

add_interface_port m1_clk csi_m1_clk clk Input 1

# 
# connection point m1
# 
add_interface m1 avalon master
set_interface_property m1 addressUnits SYMBOLS
set_interface_property m1 associatedClock m1_clk
set_interface_property m1 associatedReset reset
set_interface_property m1 bitsPerSymbol 8
set_interface_property m1 burstOnBurstBoundariesOnly false
set_interface_property m1 burstcountUnits WORDS
set_interface_property m1 doStreamReads false
set_interface_property m1 doStreamWrites false
set_interface_property m1 holdTime 0
set_interface_property m1 linewrapBursts false
set_interface_property m1 maximumPendingReadTransactions 0
set_interface_property m1 maximumPendingWriteTransactions 0
set_interface_property m1 readLatency 0
set_interface_property m1 readWaitTime 1
set_interface_property m1 setupTime 0
set_interface_property m1 timingUnits Cycles
set_interface_property m1 writeWaitTime 0

add_interface_port m1 avm_m1_waitrequest waitrequest Input 1
add_interface_port m1 avm_m1_address address Output 32
add_interface_port m1 avm_m1_burstcount burstcount Output 10
add_interface_port m1 avm_m1_read read Output 1
add_interface_port m1 avm_m1_readdata readdata Input 32
add_interface_port m1 avm_m1_readdatavalid readdatavalid Input 1


#-----------------------------------
# Conduit interface
#-----------------------------------
# 
# connection point export
# 
add_interface pcm conduit end
add_interface_port pcm coe_pcm_fs fs Input 1
add_interface_port pcm coe_pcm_l left Input 24
add_interface_port pcm coe_pcm_r right Input 24

add_interface vga conduit end
add_interface_port vga coe_vga_clk videoclk Input 1
add_interface_port vga coe_vga_active active Output 1
add_interface_port vga coe_vga_rout rout Output 8
add_interface_port vga coe_vga_gout gout Output 8
add_interface_port vga coe_vga_bout bout Output 8
add_interface_port vga coe_vga_hsync_n hsync_n Output 1
add_interface_port vga coe_vga_vsync_n vsync_n Output 1
add_interface_port vga coe_vga_csync_n csync_n Output 1

add_interface tmds conduit end
add_interface_port tmds coe_ser_clk videoclk Input 1
add_interface_port tmds coe_ser_x5clk txclk Input 1
add_interface_port tmds coe_ser_data data Output 3
add_interface_port tmds coe_ser_data_n data_n Output 3
add_interface_port tmds coe_ser_clock clock Output 1
add_interface_port tmds coe_ser_clock_n clock_n Output 1


# *******************************************************************
#
#  File generate callback
#
# *******************************************************************

proc generate_synth {entityname} {
	set hdlpath "./hdl"

	add_fileset_file peridot_vga.vhd			VHDL PATH "${hdlpath}/peridot_vga.vhd" TOP_LEVEL_FILE
	add_fileset_file peridot_vga_csr.vhd		VHDL PATH "${hdlpath}/peridot_vga_csr.vhd"
	add_fileset_file peridot_vga_avm.vhd		VHDL PATH "${hdlpath}/peridot_vga_avm.vhd"
	add_fileset_file peridot_vga_yvu2rgb.vhd	VHDL PATH "${hdlpath}/peridot_vga_yvu2rgb.vhd"
	add_fileset_file video_syncgen.vhd			VHDL PATH "${hdlpath}/video_syncgen.vhd"

	if {[get_parameter_value VIDEO_INTERFACE] != "PARALLEL"} {
		add_fileset_file hdmi_tx.vhd VHDL PATH "${hdlpath}/hdmi_tx.vhd"
	}
}


# *******************************************************************
#
#  Elaboration callback
#
# *******************************************************************

proc elaboration_callback {} {

	#-----------------------------------
	# video timing settings
	#-----------------------------------

	set resolution [get_parameter_value SUPPORT_RESOLUTION]
	set resoparam_enable [expr $resolution == 99 ? true : false]

	set_parameter_property VIDEO_HTOTAL ENABLED $resoparam_enable
	set_parameter_property VIDEO_HSYNC ENABLED $resoparam_enable
	set_parameter_property VIDEO_HBACKP ENABLED $resoparam_enable
	set_parameter_property VIDEO_HACTIVE ENABLED $resoparam_enable
	set_parameter_property VIDEO_VTOTAL ENABLED $resoparam_enable
	set_parameter_property VIDEO_VSYNC ENABLED $resoparam_enable
	set_parameter_property VIDEO_VBACKP ENABLED $resoparam_enable
	set_parameter_property VIDEO_VACTIVE ENABLED $resoparam_enable

	switch $resolution {
	"0" {set timing {25.200 800 96 48 640 525 2 33 480}}
	"1" {set timing {30.000 953 48 40 800 525 3 29 480}}
	"2" {set timing {40.000 1056 128 88 800 628 4 23 600}}
	"3" {set timing {65.000 1344 136 160 1024 806 6 29 768}}
	"4" {set timing {72.000 1500 56 64 1366 800 3 28 768}}
	"5" {set timing {108.000 1688 112 248 1280 1066 3 38 1024}}
	"6" {set timing {27.000 858 62 60 720 525 6 30 480}}
	"7" {set timing {74.250 1650 40 220 1280 750 5 20 720}}
	"8" {set timing {148.500 2200 44 148 1920 1125 5 36 1080}}
	"99" {
		set timing {}
		lappend timing [get_parameter_value DOTCLOCK_FREQUENCY]
		lappend timing [get_parameter_value VIDEO_HTOTAL]
		lappend timing [get_parameter_value VIDEO_HSYNC]
		lappend timing [get_parameter_value VIDEO_HBACKP]
		lappend timing [get_parameter_value VIDEO_HACTIVE]
		lappend timing [get_parameter_value VIDEO_VTOTAL]
		lappend timing [get_parameter_value VIDEO_VSYNC]
		lappend timing [get_parameter_value VIDEO_VBACKP]
		lappend timing [get_parameter_value VIDEO_VACTIVE]

		if {[expr [lindex $timing 4] % 2] != 0} {
			send_message error "Horizontal active pixels has to set a multiple of 2."
		}
	}
	default {
		send_message error "Don't defined resolution."
	}}

	if {[get_parameter_value DOTCLOCK_FREQUENCY] != [lindex $timing 0]} {
		set recfreq [lindex $timing 0]
		send_message info "Recommended video clock frequency is ${recfreq} MHz."
	}

	set_parameter_value VGACLOCK_FREQUENCY [expr int([get_parameter_value DOTCLOCK_FREQUENCY] * 1000000.0)]
	set_parameter_value H_TOTAL		[lindex $timing 1]
	set_parameter_value H_SYNC		[lindex $timing 2]
	set_parameter_value H_BACKP		[lindex $timing 3]
	set_parameter_value H_ACTIVE	[lindex $timing 4]
	set_parameter_value V_TOTAL		[lindex $timing 5]
	set_parameter_value V_SYNC		[lindex $timing 6]
	set_parameter_value V_BACKP		[lindex $timing 7]
	set_parameter_value V_ACTIVE	[lindex $timing 8]


	#-----------------------------------
	# Burstcount settings
	#-----------------------------------

	set burstcount [expr ceil([get_parameter_value H_ACTIVE] / 2.0)]
	if {$burstcount > 0} {
		set burstlength [expr int(ceil(log10($burstcount) / log10(2.0)))]
		set_parameter_value BURSTLENGTH_WIDTH $burstlength
		add_interface_port m1 avm_m1_burstcount burstcount Output [expr $burstlength + 1]
	} else {
		send_message error "Specify a value for Horizontal active pixels."
	}


	#-----------------------------------
	# Video interface settings
	#-----------------------------------

	if {[get_parameter_value VIDEO_INTERFACE] == "PARALLEL"} {
		set_interface_property vga ENABLED true
		set_interface_property tmds ENABLED false
	} else {
		set_interface_property vga ENABLED false
		set_interface_property tmds ENABLED true
	}


	#-----------------------------------
	# PCM port settings
	#-----------------------------------

	if {[get_parameter_value VIDEO_INTERFACE] == "HDMI"} {
		set_parameter_property SUPPORT_AUDIOSTREAM ENABLED true
		set pcmport_enable [expr [get_parameter_value SUPPORT_AUDIOSTREAM]? true : false]
	} else {
		set_parameter_property SUPPORT_AUDIOSTREAM ENABLED false
		set pcmport_enable false
	}

	set_parameter_property PCMSAMPLE_FREQUENCY ENABLED $pcmport_enable
	set_parameter_value USE_AUDIOSTREAM [expr $pcmport_enable? "ON" : "OFF"]
	set_interface_property pcm ENABLED $pcmport_enable


	#-----------------------------------
	# Software assignments
	#-----------------------------------

	set_module_assignment embeddedsw.CMacro.VRAM_PIXELCOLOR	\"[get_parameter_value PIXEL_COLORORDER]\"
	set_module_assignment embeddedsw.CMacro.VRAM_DATAORDER	\"[get_parameter_value PIXEL_DATAORDER]\"
	set_module_assignment embeddedsw.CMacro.VRAM_LINEBYTES	[format %u [get_parameter_value LINEOFFSETBYTES]]
	set_module_assignment embeddedsw.CMacro.VRAM_VIEWWIDTH	[format %u [get_parameter_value H_ACTIVE]]
	set_module_assignment embeddedsw.CMacro.VRAM_VIEWHEIGHT	[format %u [get_parameter_value V_ACTIVE]]
	set_module_assignment embeddedsw.CMacro.VIDEO_INTERFACE	\"[get_parameter_value VIDEO_INTERFACE]\"
	set_module_assignment embeddedsw.CMacro.VIDEO_CLOCK_HZ	[get_parameter_value VGACLOCK_FREQUENCY]
	set_module_assignment embeddedsw.CMacro.VIDEO_HTOTAL	[format %u [get_parameter_value H_TOTAL]]
	set_module_assignment embeddedsw.CMacro.VIDEO_HSYNC		[format %u [get_parameter_value H_SYNC]]
	set_module_assignment embeddedsw.CMacro.VIDEO_HBACKP	[format %u [get_parameter_value H_BACKP]]
	set_module_assignment embeddedsw.CMacro.VIDEO_HACTIVE	[format %u [get_parameter_value H_ACTIVE]]
	set_module_assignment embeddedsw.CMacro.VIDEO_VTOTAL	[format %u [get_parameter_value V_TOTAL]]
	set_module_assignment embeddedsw.CMacro.VIDEO_VSYNC		[format %u [get_parameter_value V_SYNC]]
	set_module_assignment embeddedsw.CMacro.VIDEO_VBACKP	[format %u [get_parameter_value V_BACKP]]
	set_module_assignment embeddedsw.CMacro.VIDEO_VACTIVE	[format %u [get_parameter_value V_ACTIVE]]
	set_module_assignment embeddedsw.CMacro.USE_PCMSTREAM	[expr $pcmport_enable? 1 : 0]

	if {$pcmport_enable} {
		set_module_assignment embeddedsw.CMacro.PCMSAMPLING_HZ [get_parameter_value PCMSAMPLE_FREQUENCY]
	}
}