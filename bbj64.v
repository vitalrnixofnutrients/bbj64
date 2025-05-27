// The BitBitJump Instruction Set Architecture
// is now released into the Public Domain.

`default_nettype none
module bbj64(clk);
	input wire [0:0] clk;
	reg [268435455:0] memory;
	reg [192:0] bbj64reg;
	reg [63:0] bbj64ipAddr = 64'b0000000000000000000000000000000000000000000000000000000011000000;
	reg [63:0] bbj64srcAddr;
	reg [63:0] bbj64destAddr;
	integer i;
	always @(posedge clk) begin
		bbj64reg[191:0] <= memory[bbj64ipAddr-:192];
		bbj64ipAddr[63:0] <= bbj64reg[191:128];
		bbj64srcAddr[63:0] <= bbj64reg[127:64];
		bbj64destAddr[63:0] <= bbj64reg[63:0];
		bbj64reg[192] <= memory[bbj64srcAddr];
		memory[bbj64destAddr] <= bbj64reg[192];
	end
endmodule
