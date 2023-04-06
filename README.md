PERIDOT-Air
===========

Overview
--------
<img src="https://raw.githubusercontent.com/osafune/peridot_air/master/img/air_thumb.jpg">

PERIDOT-AIRは Intel社製 CycloneIV E FPGA(EP4CE6E22C8N)を搭載したプロトタイピング向けFPGAボードです。FPGAの他に256MbitのSDRAM、SD/MMCカードスロット、OSCおよびコンフィギュレーションROMをオンボードに搭載しており、インスタントオンで動作させることができます。  
搭載FPGAは約15万ゲート規模で、ソフトマクロCPUを使った組み込み用SoC開発やディジタル回路の実装に最適です。  
ボード形状はArduinoと同一になっており、Arduino用のホルダーや各種シールドを使うことができます。  

- 搭載FPGAデバイス
	- Intel Cyclone IV Eファミリ EP4CE6E22C8N
	(6kLE, 内蔵メモリ 270kbit, PLL 2個, 18x18乗算器 15個)
- オンボード周辺機器
	- SDRAM 256Mbit 16bit幅×4Mワード×4バンク
	- コンフィギュレーションROM EPCQ16互換 16Mbit
	- MEMS OSC 50MHz
	- SD/MMCカードスロット
	- ユーザーLED 2個
- ユーザーI/O数
	- 28本（Arduinoタイプピンソケット）  
	⚠️I/O電圧は3.3Vです。5V信号入力はできません。
- 動作電圧
	- オンボードmicro-Bコネクタからの4.5V～5.5V、またはArduinoピンソケットのVIN端子からの4.5V～9V
	FPGA電源(1.2V、2.5V)およびI/O電源(3.3V)はオンボードで生成

**ブロック図**
<img src="https://raw.githubusercontent.com/osafune/peridot_air/master/img/air_block.png">


Board Pinout
------------
<img src="https://raw.githubusercontent.com/osafune/peridot_air/master/img/air_pinout.png">

[Large size](https://raw.githubusercontent.com/osafune/peridot_air/master/img/air_pinout_large.png)


Configuration
-------------
ボード上のJTAGコネクタ経由でQuartusPrime／NiosII EDSからsofファイルまたはjicファイルのダウンロード、SignalTapII（組み込みロジックアナライザ）、NiosIIプロセッサのJtag-gdbを使うことができます。  
[PERIDOT-Airのプロジェクト](https://github.com/osafune/peridot_air/tree/main/fpga)を流用する場合、jicファイルは自動で生成されます。
- 参考：[FPGA経由でEPCQデバイスへプログラミング](https://www.macnica.co.jp/business/semiconductor/articles/intel/122065/)

同梱のJTAG-CONN変換基板を下記のように接続してUSB-Blasterダウンロードケーブルを使用してください。

<img src="https://raw.githubusercontent.com/osafune/peridot_air/master/img/air_jtagconn.jpg" width="600" height="333">



Resource
--------
- [回路図 (pdf)](https://raw.githubusercontent.com/osafune/peridot_air/master/pcb/peridot_air_pcb_schem_rev1.1r.pdf)
- [PERIDOTペリフェラル](https://github.com/osafune/peridot_peripherals)
- [MISCモジュール集](https://github.com/osafune/misc_hdl_module)


Documents
---------
- [QuartusPrime 20.1.1 LiteEdition ダウンロード](https://www.intel.com/content/www/us/en/software-kit/660907/intel-quartus-prime-lite-edition-design-software-version-20-1-1-for-windows.html)
- [Intel CycloneIV E のドキュメント](https://www.intel.co.jp/content/www/jp/ja/products/details/fpga/cyclone/iv/docs.html?s=Newest)
- [Platform Designer のドキュメント](https://www.intel.co.jp/content/www/jp/ja/software/programmable/quartus-prime/qts-platform-designer.html)


Buy now
-------

準備中


Contant Us
----------
- [GitHub - Shun OSAFUNE](https://github.com/osafune)
- Mail - sales@j7system.jp
