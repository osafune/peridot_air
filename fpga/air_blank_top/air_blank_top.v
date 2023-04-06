// ===================================================================
// TITLE : PERIDOT-Air Blank top
//
//     DESIGN : s.osafune@j7system.jp (J-7SYSTEM WORKS LIMITED)
//     DATE   : 2018/01/19 -> 2018/03/22
//     UPDATE : 2023/04/03
//
// ===================================================================
//
// The MIT License (MIT)
// Copyright (c) 2020 J-7SYSTEM WORKS LIMITED.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is furnished to do
// so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

`default_nettype none

module air_blank_top(
	// clk and system reset
	input wire			CLOCK_50,
	input wire			RESET_N,

	// Interface: EPCS memory controller
	output wire			EPCS_CSO_N,
	output wire			EPCS_DCLK,
	output wire			EPCS_ASDO,
	input wire			EPCS_DATA0,

	// Interface: SD-card controller
	output wire			SD_DAT3,
	output wire			SD_CLK,
	output wire			SD_CMD,
	input wire			SD_DAT0,

	// Interface: SD-card Power enable
	output wire			SD_PWR_N,

	// Interface: SD-card Detect
	input wire			SD_CD_N,

	// Interface: SDRAM
	output wire			SDRCLK_OUT,
	output wire			SDR_CKE,
	output wire			SDR_CS_N,
	output wire			SDR_RAS_N,
	output wire			SDR_CAS_N,
	output wire			SDR_WE_N,
	output wire [12:0]	SDR_A,
	output wire [1:0]	SDR_BA,
	inout wire  [15:0]	SDR_DQ,
	output wire [1:0]	SDR_DQM,

	// GPIO
	inout wire  [27:0]	D,

	// OnBoard LED
	output wire [1:0]	USER_LED
);


/* ===== 外部変更可能パラメータ ========== */



/* ----- 内部パラメータ ------------------ */


/* ※以降のパラメータ宣言は禁止※ */

/* ===== ノード宣言 ====================== */
				/* 内部は全て正論理リセットとする。ここで定義していないノードの使用は禁止 */
	wire			reset_sig = ~RESET_N;			// モジュール内部駆動非同期リセット 

				/* 内部は全て正エッジ駆動とする。ここで定義していないクロックノードの使用は禁止 */
	wire			clock_sig = CLOCK_50;			// モジュール内部駆動クロック 



/* ※以降のwire、reg宣言は禁止※ */

/* ===== テスト記述 ============== */



/* ===== モジュール構造記述 ============== */

	assign {EPCS_DCLK,EPCS_ASDO,EPCS_CSO_N} = 3'b001;		// コンフィグROMをユーザーモードで使わない場合 
	assign {SD_CLK,SD_CMD,SD_DAT3,SD_PWR_N} = 4'bzzz1;		// SDカードを使わない場合 
	assign {SDRCLK_OUT,SDR_CKE} = 2'b00;					// SDRAMを使わない場合 






endmodule
