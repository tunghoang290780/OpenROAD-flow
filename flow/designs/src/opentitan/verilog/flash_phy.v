module flash_phy (
	clk_i,
	rst_ni,
	host_req_i,
	host_addr_i,
	host_req_rdy_o,
	host_req_done_o,
	host_rdata_o,
	flash_ctrl_i,
	flash_ctrl_o
);
	localparam top_pkg_FLASH_BANKS = 2;
	localparam top_pkg_FLASH_PAGES_PER_BANK = 256;
	localparam top_pkg_FLASH_WORDS_PER_PAGE = 256;
	localparam top_pkg_FLASH_BYTES_PER_WORD = 4;
	localparam top_pkg_FLASH_BKW = 1;
	localparam top_pkg_FLASH_PGW = 8;
	localparam top_pkg_FLASH_WDW = 8;
	localparam top_pkg_FLASH_AW = ((top_pkg_FLASH_BKW + top_pkg_FLASH_PGW) + top_pkg_FLASH_WDW);
	localparam top_pkg_FLASH_DW = (top_pkg_FLASH_BYTES_PER_WORD * 8);
	parameter signed [31:0] NumBanks = 2;
	parameter signed [31:0] PagesPerBank = 256;
	parameter signed [31:0] WordsPerPage = 256;
	parameter signed [31:0] DataWidth = 32;
	localparam signed [31:0] BankW = $clog2(NumBanks);
	localparam signed [31:0] PageW = $clog2(PagesPerBank);
	localparam signed [31:0] WordW = $clog2(WordsPerPage);
	localparam signed [31:0] AddrW = ((BankW + PageW) + WordW);
	input clk_i;
	input rst_ni;
	input host_req_i;
	input [(AddrW - 1):0] host_addr_i;
	output wire host_req_rdy_o;
	output wire host_req_done_o;
	output wire [(DataWidth - 1):0] host_rdata_o;
	input wire [(((5 + top_pkg_FLASH_AW) + top_pkg_FLASH_DW) - 1):0] flash_ctrl_i;
	output wire [(((3 + top_pkg_FLASH_DW) + 1) - 1):0] flash_ctrl_o;
	localparam FlashMacroOustanding = 1;
	localparam SeqFifoDepth = (FlashMacroOustanding * NumBanks);
	wire [(BankW - 1):0] host_bank_sel;
	wire [(BankW - 1):0] rsp_bank_sel;
	wire [(NumBanks - 1):0] host_req_rdy;
	wire [(NumBanks - 1):0] host_req_done;
	wire [(NumBanks - 1):0] host_rsp_avail;
	wire [(NumBanks - 1):0] host_rsp_vld;
	wire [(NumBanks - 1):0] host_rsp_ack;
	wire [(DataWidth - 1):0] host_rsp_data [0:(NumBanks - 1)];
	wire seq_fifo_rdy;
	wire seq_fifo_pending;
	wire [(BankW - 1):0] ctrl_bank_sel;
	wire [(NumBanks - 1):0] rd_done;
	wire [(NumBanks - 1):0] prog_done;
	wire [(NumBanks - 1):0] erase_done;
	wire [(NumBanks - 1):0] init_busy;
	wire [(DataWidth - 1):0] rd_data [0:(NumBanks - 1)];
	assign host_bank_sel = (host_req_i ? host_addr_i[(PageW + WordW)+:BankW] : 1'sb0);
	assign ctrl_bank_sel = flash_ctrl_i[((PageW + WordW) + top_pkg_FLASH_DW)+:BankW];
	assign host_req_rdy_o = ((host_req_rdy[host_bank_sel] & host_rsp_avail[host_bank_sel]) & seq_fifo_rdy);
	assign host_req_done_o = (seq_fifo_pending & host_rsp_vld[rsp_bank_sel]);
	assign host_rdata_o = host_rsp_data[rsp_bank_sel];
	assign flash_ctrl_o[(1 + (1 + (1 + top_pkg_FLASH_DW))):(1 + (1 + (top_pkg_FLASH_DW + 1)))] = rd_done[ctrl_bank_sel];
	assign flash_ctrl_o[(1 + (1 + top_pkg_FLASH_DW)):(1 + (top_pkg_FLASH_DW + 1))] = prog_done[ctrl_bank_sel];
	assign flash_ctrl_o[(1 + top_pkg_FLASH_DW):(top_pkg_FLASH_DW + 1)] = erase_done[ctrl_bank_sel];
	assign flash_ctrl_o[top_pkg_FLASH_DW:1] = rd_data[ctrl_bank_sel];
	assign flash_ctrl_o[0:0] = |init_busy;
	prim_fifo_sync #(
		.Width(BankW),
		.Pass(0),
		.Depth(SeqFifoDepth)
	) bank_sequence_fifo(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.clr_i(1'b0),
		.wvalid((host_req_i & host_req_rdy_o)),
		.wready(seq_fifo_rdy),
		.wdata(host_bank_sel),
		.depth(),
		.rvalid(seq_fifo_pending),
		.rready(host_req_done_o),
		.rdata(rsp_bank_sel)
	);
	generate
		genvar gen_flash_banks_bank;
		for (gen_flash_banks_bank = 0; (gen_flash_banks_bank < NumBanks); gen_flash_banks_bank = (gen_flash_banks_bank + 1)) begin : gen_flash_banks
			assign host_rsp_ack[gen_flash_banks_bank] = (host_req_done_o & (rsp_bank_sel == gen_flash_banks_bank));
			prim_fifo_sync #(
				.Width(DataWidth),
				.Pass(1'b1),
				.Depth(FlashMacroOustanding)
			) host_rsp_fifo(
				.clk_i(clk_i),
				.rst_ni(rst_ni),
				.clr_i(1'b0),
				.wvalid(host_req_done[gen_flash_banks_bank]),
				.wready(host_rsp_avail[gen_flash_banks_bank]),
				.wdata(rd_data[gen_flash_banks_bank]),
				.depth(),
				.rvalid(host_rsp_vld[gen_flash_banks_bank]),
				.rready(host_rsp_ack[gen_flash_banks_bank]),
				.rdata(host_rsp_data[gen_flash_banks_bank])
			);
			prim_flash #(
				.PagesPerBank(PagesPerBank),
				.WordsPerPage(WordsPerPage),
				.DataWidth(DataWidth)
			) u_flash(
				.clk_i(clk_i),
				.rst_ni(rst_ni),
				.req_i((flash_ctrl_i[(1 + (1 + (1 + (1 + (1 + (top_pkg_FLASH_AW + (top_pkg_FLASH_DW + -1))))))):(1 + (1 + (1 + (1 + (top_pkg_FLASH_AW + top_pkg_FLASH_DW)))))] & (ctrl_bank_sel == gen_flash_banks_bank))),
				.host_req_i(((host_req_i & host_req_rdy_o) & (host_bank_sel == gen_flash_banks_bank))),
				.host_addr_i(host_addr_i[0+:(PageW + WordW)]),
				.rd_i(flash_ctrl_i[(1 + (1 + (1 + (1 + (top_pkg_FLASH_AW + (top_pkg_FLASH_DW + -1)))))):(1 + (1 + (1 + (top_pkg_FLASH_AW + top_pkg_FLASH_DW))))]),
				.prog_i(flash_ctrl_i[(1 + (1 + (1 + (top_pkg_FLASH_AW + (top_pkg_FLASH_DW + -1))))):(1 + (1 + (top_pkg_FLASH_AW + top_pkg_FLASH_DW)))]),
				.pg_erase_i(flash_ctrl_i[(1 + (1 + (top_pkg_FLASH_AW + (top_pkg_FLASH_DW + -1)))):(1 + (top_pkg_FLASH_AW + top_pkg_FLASH_DW))]),
				.bk_erase_i(flash_ctrl_i[(1 + (top_pkg_FLASH_AW + (top_pkg_FLASH_DW + -1))):(top_pkg_FLASH_AW + top_pkg_FLASH_DW)]),
				.addr_i(flash_ctrl_i[top_pkg_FLASH_DW+:(PageW + WordW)]),
				.prog_data_i(flash_ctrl_i[(top_pkg_FLASH_DW + -1):0]),
				.host_req_rdy_o(host_req_rdy[gen_flash_banks_bank]),
				.host_req_done_o(host_req_done[gen_flash_banks_bank]),
				.rd_done_o(rd_done[gen_flash_banks_bank]),
				.prog_done_o(prog_done[gen_flash_banks_bank]),
				.erase_done_o(erase_done[gen_flash_banks_bank]),
				.rd_data_o(rd_data[gen_flash_banks_bank]),
				.init_busy_o(init_busy[gen_flash_banks_bank])
			);
		end
	endgenerate
endmodule