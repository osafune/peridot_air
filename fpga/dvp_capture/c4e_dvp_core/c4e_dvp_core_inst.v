	c4e_dvp_core u0 (
		.clk_100m_clk  (<connected-to-clk_100m_clk>),  // clk_100m.clk
		.clk_25m_clk   (<connected-to-clk_25m_clk>),   //  clk_25m.clk
		.dvp_pclk      (<connected-to-dvp_pclk>),      //      dvp.pclk
		.dvp_data      (<connected-to-dvp_data>),      //         .data
		.dvp_href      (<connected-to-dvp_href>),      //         .href
		.dvp_vsync     (<connected-to-dvp_vsync>),     //         .vsync
		.dvp_reseto_n  (<connected-to-dvp_reseto_n>),  //         .reseto_n
		.host_txd      (<connected-to-host_txd>),      //     host.txd
		.host_rxd      (<connected-to-host_rxd>),      //         .rxd
		.host_cts      (<connected-to-host_cts>),      //         .cts
		.host_rts      (<connected-to-host_rts>),      //         .rts
		.led_export    (<connected-to-led_export>),    //      led.export
		.reset_reset_n (<connected-to-reset_reset_n>), //    reset.reset_n
		.sccb_sck      (<connected-to-sccb_sck>),      //     sccb.sck
		.sccb_data     (<connected-to-sccb_data>),     //         .data
		.sdr_addr      (<connected-to-sdr_addr>),      //      sdr.addr
		.sdr_ba        (<connected-to-sdr_ba>),        //         .ba
		.sdr_cas_n     (<connected-to-sdr_cas_n>),     //         .cas_n
		.sdr_cke       (<connected-to-sdr_cke>),       //         .cke
		.sdr_cs_n      (<connected-to-sdr_cs_n>),      //         .cs_n
		.sdr_dq        (<connected-to-sdr_dq>),        //         .dq
		.sdr_dqm       (<connected-to-sdr_dqm>),       //         .dqm
		.sdr_ras_n     (<connected-to-sdr_ras_n>),     //         .ras_n
		.sdr_we_n      (<connected-to-sdr_we_n>),      //         .we_n
		.tmds_videoclk (<connected-to-tmds_videoclk>), //     tmds.videoclk
		.tmds_txclk    (<connected-to-tmds_txclk>),    //         .txclk
		.tmds_data     (<connected-to-tmds_data>),     //         .data
		.tmds_data_n   (<connected-to-tmds_data_n>),   //         .data_n
		.tmds_clock    (<connected-to-tmds_clock>),    //         .clock
		.tmds_clock_n  (<connected-to-tmds_clock_n>)   //         .clock_n
	);

