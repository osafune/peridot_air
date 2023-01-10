
module c4e_dvp_core (
	clk_100m_clk,
	clk_25m_clk,
	dvp_pclk,
	dvp_data,
	dvp_href,
	dvp_vsync,
	dvp_reseto_n,
	host_txd,
	host_rxd,
	host_cts,
	host_rts,
	led_export,
	reset_reset_n,
	sccb_sck,
	sccb_data,
	sdr_addr,
	sdr_ba,
	sdr_cas_n,
	sdr_cke,
	sdr_cs_n,
	sdr_dq,
	sdr_dqm,
	sdr_ras_n,
	sdr_we_n,
	tmds_videoclk,
	tmds_txclk,
	tmds_data,
	tmds_data_n,
	tmds_clock,
	tmds_clock_n);	

	input		clk_100m_clk;
	input		clk_25m_clk;
	input		dvp_pclk;
	input	[7:0]	dvp_data;
	input		dvp_href;
	input		dvp_vsync;
	output		dvp_reseto_n;
	output		host_txd;
	input		host_rxd;
	input		host_cts;
	output		host_rts;
	output	[3:0]	led_export;
	input		reset_reset_n;
	inout		sccb_sck;
	inout		sccb_data;
	output	[12:0]	sdr_addr;
	output	[1:0]	sdr_ba;
	output		sdr_cas_n;
	output		sdr_cke;
	output		sdr_cs_n;
	inout	[15:0]	sdr_dq;
	output	[1:0]	sdr_dqm;
	output		sdr_ras_n;
	output		sdr_we_n;
	input		tmds_videoclk;
	input		tmds_txclk;
	output	[2:0]	tmds_data;
	output	[2:0]	tmds_data_n;
	output		tmds_clock;
	output		tmds_clock_n;
endmodule
