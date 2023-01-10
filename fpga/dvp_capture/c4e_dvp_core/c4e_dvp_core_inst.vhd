	component c4e_dvp_core is
		port (
			clk_100m_clk  : in    std_logic                     := 'X';             -- clk
			clk_25m_clk   : in    std_logic                     := 'X';             -- clk
			dvp_pclk      : in    std_logic                     := 'X';             -- pclk
			dvp_data      : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- data
			dvp_href      : in    std_logic                     := 'X';             -- href
			dvp_vsync     : in    std_logic                     := 'X';             -- vsync
			dvp_reseto_n  : out   std_logic;                                        -- reseto_n
			host_txd      : out   std_logic;                                        -- txd
			host_rxd      : in    std_logic                     := 'X';             -- rxd
			host_cts      : in    std_logic                     := 'X';             -- cts
			host_rts      : out   std_logic;                                        -- rts
			led_export    : out   std_logic_vector(3 downto 0);                     -- export
			reset_reset_n : in    std_logic                     := 'X';             -- reset_n
			sccb_sck      : inout std_logic                     := 'X';             -- sck
			sccb_data     : inout std_logic                     := 'X';             -- data
			sdr_addr      : out   std_logic_vector(12 downto 0);                    -- addr
			sdr_ba        : out   std_logic_vector(1 downto 0);                     -- ba
			sdr_cas_n     : out   std_logic;                                        -- cas_n
			sdr_cke       : out   std_logic;                                        -- cke
			sdr_cs_n      : out   std_logic;                                        -- cs_n
			sdr_dq        : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdr_dqm       : out   std_logic_vector(1 downto 0);                     -- dqm
			sdr_ras_n     : out   std_logic;                                        -- ras_n
			sdr_we_n      : out   std_logic;                                        -- we_n
			tmds_videoclk : in    std_logic                     := 'X';             -- videoclk
			tmds_txclk    : in    std_logic                     := 'X';             -- txclk
			tmds_data     : out   std_logic_vector(2 downto 0);                     -- data
			tmds_data_n   : out   std_logic_vector(2 downto 0);                     -- data_n
			tmds_clock    : out   std_logic;                                        -- clock
			tmds_clock_n  : out   std_logic                                         -- clock_n
		);
	end component c4e_dvp_core;

	u0 : component c4e_dvp_core
		port map (
			clk_100m_clk  => CONNECTED_TO_clk_100m_clk,  -- clk_100m.clk
			clk_25m_clk   => CONNECTED_TO_clk_25m_clk,   --  clk_25m.clk
			dvp_pclk      => CONNECTED_TO_dvp_pclk,      --      dvp.pclk
			dvp_data      => CONNECTED_TO_dvp_data,      --         .data
			dvp_href      => CONNECTED_TO_dvp_href,      --         .href
			dvp_vsync     => CONNECTED_TO_dvp_vsync,     --         .vsync
			dvp_reseto_n  => CONNECTED_TO_dvp_reseto_n,  --         .reseto_n
			host_txd      => CONNECTED_TO_host_txd,      --     host.txd
			host_rxd      => CONNECTED_TO_host_rxd,      --         .rxd
			host_cts      => CONNECTED_TO_host_cts,      --         .cts
			host_rts      => CONNECTED_TO_host_rts,      --         .rts
			led_export    => CONNECTED_TO_led_export,    --      led.export
			reset_reset_n => CONNECTED_TO_reset_reset_n, --    reset.reset_n
			sccb_sck      => CONNECTED_TO_sccb_sck,      --     sccb.sck
			sccb_data     => CONNECTED_TO_sccb_data,     --         .data
			sdr_addr      => CONNECTED_TO_sdr_addr,      --      sdr.addr
			sdr_ba        => CONNECTED_TO_sdr_ba,        --         .ba
			sdr_cas_n     => CONNECTED_TO_sdr_cas_n,     --         .cas_n
			sdr_cke       => CONNECTED_TO_sdr_cke,       --         .cke
			sdr_cs_n      => CONNECTED_TO_sdr_cs_n,      --         .cs_n
			sdr_dq        => CONNECTED_TO_sdr_dq,        --         .dq
			sdr_dqm       => CONNECTED_TO_sdr_dqm,       --         .dqm
			sdr_ras_n     => CONNECTED_TO_sdr_ras_n,     --         .ras_n
			sdr_we_n      => CONNECTED_TO_sdr_we_n,      --         .we_n
			tmds_videoclk => CONNECTED_TO_tmds_videoclk, --     tmds.videoclk
			tmds_txclk    => CONNECTED_TO_tmds_txclk,    --         .txclk
			tmds_data     => CONNECTED_TO_tmds_data,     --         .data
			tmds_data_n   => CONNECTED_TO_tmds_data_n,   --         .data_n
			tmds_clock    => CONNECTED_TO_tmds_clock,    --         .clock
			tmds_clock_n  => CONNECTED_TO_tmds_clock_n   --         .clock_n
		);

