module tlul_socket_1n (
	clk_i,
	rst_ni,
	tl_h_i,
	tl_h_o,
	tl_d_o,
	tl_d_i,
	dev_select
);
	localparam top_pkg_TL_AW = 32;
	localparam top_pkg_TL_DW = 32;
	localparam top_pkg_TL_AIW = 8;
	localparam top_pkg_TL_DIW = 1;
	localparam top_pkg_TL_DUW = 16;
	localparam top_pkg_TL_DBW = (top_pkg_TL_DW >> 3);
	localparam top_pkg_TL_SZW = $clog2(($clog2((32 >> 3)) + 1));
	parameter N = 4;
	parameter HReqPass = 1'b1;
	parameter HRspPass = 1'b1;
	parameter [(N - 1):0] DReqPass = {N {1'b1}};
	parameter [(N - 1):0] DRspPass = {N {1'b1}};
	parameter [3:0] HReqDepth = 4'h2;
	parameter [3:0] HRspDepth = 4'h2;
	parameter [((N * 4) - 1):0] DReqDepth = {N {4'h2}};
	parameter [((N * 4) - 1):0] DRspDepth = {N {4'h2}};
	parameter NWD = $clog2((N + 1));
	input clk_i;
	input rst_ni;
	input wire [(((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17) - 1):0] tl_h_i;
	output wire [(((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2) - 1):0] tl_h_o;
	output wire [((0 >= (N - 1)) ? (((((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 40) + ((((32 >> 3) - 1) >= 0) ? (32 >> 3) : (2 - (32 >> 3)))) + 49) - 1) >= 0) ? ((((0 >= (N - 1)) ? (2 - N) : N) * (((((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 40) + ((((32 >> 3) - 1) >= 0) ? (32 >> 3) : (2 - (32 >> 3)))) + 49) - 1) >= 0) ? ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17) : (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17)))) + (((N - 1) * (((((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 40) + ((((32 >> 3) - 1) >= 0) ? (32 >> 3) : (2 - (32 >> 3)))) + 49) - 1) >= 0) ? ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17) : (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17)))) - 1)) : ((((0 >= (N - 1)) ? (2 - N) : N) * ((0 >= (((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 40) + ((((32 >> 3) - 1) >= 0) ? (32 >> 3) : (2 - (32 >> 3)))) + 49) - 1)) ? (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17)) : ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17))) + (((((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17) - 1) + ((N - 1) * ((0 >= (((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 40) + ((((32 >> 3) - 1) >= 0) ? (32 >> 3) : (2 - (32 >> 3)))) + 49) - 1)) ? (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17)) : ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17)))) - 1))) : (((((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 40) + ((((32 >> 3) - 1) >= 0) ? (32 >> 3) : (2 - (32 >> 3)))) + 49) - 1) >= 0) ? (((((N - 1) >= 0) ? N : (2 - N)) * (((((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 40) + ((((32 >> 3) - 1) >= 0) ? (32 >> 3) : (2 - (32 >> 3)))) + 49) - 1) >= 0) ? ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17) : (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17)))) + -1) : (((((N - 1) >= 0) ? N : (2 - N)) * ((0 >= (((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 40) + ((((32 >> 3) - 1) >= 0) ? (32 >> 3) : (2 - (32 >> 3)))) + 49) - 1)) ? (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17)) : ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17))) + ((((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17) - 1) - 1)))):((0 >= (N - 1)) ? (((((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 40) + ((((32 >> 3) - 1) >= 0) ? (32 >> 3) : (2 - (32 >> 3)))) + 49) - 1) >= 0) ? ((N - 1) * (((((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 40) + ((((32 >> 3) - 1) >= 0) ? (32 >> 3) : (2 - (32 >> 3)))) + 49) - 1) >= 0) ? ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17) : (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17)))) : ((((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17) - 1) + ((N - 1) * ((0 >= (((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 40) + ((((32 >> 3) - 1) >= 0) ? (32 >> 3) : (2 - (32 >> 3)))) + 49) - 1)) ? (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17)) : ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17))))) : (((((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 40) + ((((32 >> 3) - 1) >= 0) ? (32 >> 3) : (2 - (32 >> 3)))) + 49) - 1) >= 0) ? 0 : (((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17) - 1)))] tl_d_o;
	input wire [((0 >= (N - 1)) ? (((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 59) - 1) >= 0) ? ((((0 >= (N - 1)) ? (2 - N) : N) * (((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 59) - 1) >= 0) ? ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2) : (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2)))) + (((N - 1) * (((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 59) - 1) >= 0) ? ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2) : (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2)))) - 1)) : ((((0 >= (N - 1)) ? (2 - N) : N) * ((0 >= (((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 59) - 1)) ? (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2)) : ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2))) + (((((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2) - 1) + ((N - 1) * ((0 >= (((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 59) - 1)) ? (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2)) : ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2)))) - 1))) : (((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 59) - 1) >= 0) ? (((((N - 1) >= 0) ? N : (2 - N)) * (((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 59) - 1) >= 0) ? ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2) : (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2)))) + -1) : (((((N - 1) >= 0) ? N : (2 - N)) * ((0 >= (((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 59) - 1)) ? (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2)) : ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2))) + ((((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2) - 1) - 1)))):((0 >= (N - 1)) ? (((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 59) - 1) >= 0) ? ((N - 1) * (((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 59) - 1) >= 0) ? ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2) : (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2)))) : ((((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2) - 1) + ((N - 1) * ((0 >= (((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 59) - 1)) ? (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2)) : ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2))))) : (((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 59) - 1) >= 0) ? 0 : (((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2) - 1)))] tl_d_i;
	input [(NWD - 1):0] dev_select;
	wire [(NWD - 1):0] dev_select_t;
	wire [(((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17) - 1):0] tl_t_o;
	wire [(((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2) - 1):0] tl_t_i;
	tlul_fifo_sync #(
		.ReqPass(HReqPass),
		.RspPass(HRspPass),
		.ReqDepth(HReqDepth),
		.RspDepth(HRspDepth),
		.SpareReqW(NWD)
	) fifo_h(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.tl_h_i(tl_h_i),
		.tl_h_o(tl_h_o),
		.tl_d_o(tl_t_o),
		.tl_d_i(tl_t_i),
		.spare_req_i(dev_select),
		.spare_req_o(dev_select_t),
		.spare_rsp_i(1'b0),
		.spare_rsp_o()
	);
	reg [7:0] num_req_outstanding;
	reg [(NWD - 1):0] dev_select_outstanding;
	wire hold_all_requests;
	wire accept_t_req;
	wire accept_t_rsp;
	assign accept_t_req = (tl_t_o[(1 + (3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)))))))):(3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17)))))))] & tl_t_i[0:0]);
	assign accept_t_rsp = (tl_t_i[(1 + (3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 1)))))))):(3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 2)))))))] & tl_t_o[0:0]);
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			num_req_outstanding <= 8'h0;
			dev_select_outstanding <= 1'sb0;
		end
		else if (accept_t_req) begin
			if (!accept_t_rsp)
				num_req_outstanding <= (num_req_outstanding + 8'h1);
			dev_select_outstanding <= dev_select_t;
		end
		else if (accept_t_rsp)
			num_req_outstanding <= (num_req_outstanding - 8'h1);
	assign hold_all_requests = ((num_req_outstanding != 8'h0) & (dev_select_t != dev_select_outstanding));
	wire [(((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17) - 1):0] tl_u_o [0:((N + 1) - 1)];
	wire [(((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2) - 1):0] tl_u_i [0:((N + 1) - 1)];
	generate
		genvar gen_u_o_i;
		for (gen_u_o_i = 0; (gen_u_o_i < N); gen_u_o_i = (gen_u_o_i + 1)) begin : gen_u_o
			assign tl_u_o[gen_u_o_i][(1 + (3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)))))))):(3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17)))))))] = ((tl_t_o[(1 + (3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)))))))):(3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17)))))))] & (dev_select_t == sv2v_cast_3B809(gen_u_o_i))) & ~hold_all_requests);
			assign tl_u_o[gen_u_o_i][(3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16))))))):(3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17))))))] = tl_t_o[(3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16))))))):(3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17))))))];
			assign tl_u_o[gen_u_o_i][(3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)))))):((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17)))))] = tl_t_o[(3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)))))):((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17)))))];
			assign tl_u_o[gen_u_o_i][((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16))))):(top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17))))] = tl_t_o[((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16))))):(top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17))))];
			assign tl_u_o[gen_u_o_i][(top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)))):(top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17)))] = tl_t_o[(top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)))):(top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17)))];
			assign tl_u_o[gen_u_o_i][(top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16))):((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17))] = tl_t_o[(top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16))):((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17))];
			assign tl_u_o[gen_u_o_i][((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)):(top_pkg_TL_DW + 17)] = tl_t_o[((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)):(top_pkg_TL_DW + 17)];
			assign tl_u_o[gen_u_o_i][(top_pkg_TL_DW + 16):17] = tl_t_o[(top_pkg_TL_DW + 16):17];
			assign tl_u_o[gen_u_o_i][16:1] = tl_t_o[16:1];
		end
	endgenerate
	reg [(((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2) - 1):0] tl_t_p;
	reg hfifo_reqready;
	always @(*) begin
		hfifo_reqready = tl_u_i[N][0:0];
		begin : sv2v_autoblock_1
			reg signed [31:0] idx;
			for (idx = 0; (idx < N); idx = (idx + 1))
				if ((dev_select_t == sv2v_cast_3B809(idx)))
					hfifo_reqready = tl_u_i[idx][0:0];
		end
		if (hold_all_requests)
			hfifo_reqready = 1'b0;
	end
	assign tl_t_i[0:0] = hfifo_reqready;
	always @(*) begin
		tl_t_p = tl_u_i[N];
		begin : sv2v_autoblock_2
			reg signed [31:0] idx;
			for (idx = 0; (idx < N); idx = (idx + 1))
				if ((dev_select_outstanding == sv2v_cast_3B809(idx)))
					tl_t_p = tl_u_i[idx];
		end
	end
	assign tl_t_i[(1 + (3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 1)))))))):(3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 2)))))))] = tl_t_p[(1 + (3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 1)))))))):(3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 2)))))))];
	assign tl_t_i[(3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 1))))))):(3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 2))))))] = tl_t_p[(3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 1))))))):(3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 2))))))];
	assign tl_t_i[(3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 1)))))):((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 2)))))] = tl_t_p[(3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 1)))))):((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 2)))))];
	assign tl_t_i[((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 1))))):(top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 2))))] = tl_t_p[((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 1))))):(top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 2))))];
	assign tl_t_i[(top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 1)))):(top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 2)))] = tl_t_p[(top_pkg_TL_AIW + (top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 1)))):(top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 2)))];
	assign tl_t_i[(top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 1))):(top_pkg_TL_DW + (top_pkg_TL_DUW + 2))] = tl_t_p[(top_pkg_TL_DIW + (top_pkg_TL_DW + (top_pkg_TL_DUW + 1))):(top_pkg_TL_DW + (top_pkg_TL_DUW + 2))];
	assign tl_t_i[(top_pkg_TL_DW + (top_pkg_TL_DUW + 1)):(top_pkg_TL_DUW + 2)] = tl_t_p[(top_pkg_TL_DW + (top_pkg_TL_DUW + 1)):(top_pkg_TL_DUW + 2)];
	assign tl_t_i[(top_pkg_TL_DUW + 1):2] = tl_t_p[(top_pkg_TL_DUW + 1):2];
	assign tl_t_i[1:1] = tl_t_p[1:1];
	generate
		genvar gen_u_o_d_ready_i;
		for (gen_u_o_d_ready_i = 0; (gen_u_o_d_ready_i < (N + 1)); gen_u_o_d_ready_i = (gen_u_o_d_ready_i + 1)) begin : gen_u_o_d_ready
			assign tl_u_o[gen_u_o_d_ready_i][0:0] = tl_t_o[0:0];
		end
	endgenerate
	generate
		genvar gen_dfifo_i;
		for (gen_dfifo_i = 0; (gen_dfifo_i < N); gen_dfifo_i = (gen_dfifo_i + 1)) begin : gen_dfifo
			tlul_fifo_sync #(
				.ReqPass(DReqPass[gen_dfifo_i]),
				.RspPass(DRspPass[gen_dfifo_i]),
				.ReqDepth(DReqDepth[(gen_dfifo_i * 4)+:4]),
				.RspDepth(DRspDepth[(gen_dfifo_i * 4)+:4])
			) fifo_d(
				.clk_i(clk_i),
				.rst_ni(rst_ni),
				.tl_h_i(tl_u_o[gen_dfifo_i]),
				.tl_h_o(tl_u_i[gen_dfifo_i]),
				.tl_d_o(tl_d_o[((((((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 40) + ((((32 >> 3) - 1) >= 0) ? (32 >> 3) : (2 - (32 >> 3)))) + 49) - 1) >= 0) ? 0 : (((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17) - 1)) + (((0 >= (N - 1)) ? gen_dfifo_i : ((N - 1) - gen_dfifo_i)) * (((((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 40) + ((((32 >> 3) - 1) >= 0) ? (32 >> 3) : (2 - (32 >> 3)))) + 49) - 1) >= 0) ? ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17) : (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17)))))+:(((((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 40) + ((((32 >> 3) - 1) >= 0) ? (32 >> 3) : (2 - (32 >> 3)))) + 49) - 1) >= 0) ? ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17) : (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_AW) + (((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW))) + top_pkg_TL_DW) + 17)))]),
				.tl_d_i(tl_d_i[((((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 59) - 1) >= 0) ? 0 : (((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2) - 1)) + (((0 >= (N - 1)) ? gen_dfifo_i : ((N - 1) - gen_dfifo_i)) * (((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 59) - 1) >= 0) ? ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2) : (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2)))))+:(((((7 + ((($clog2(($clog2((32 >> 3)) + 1)) - 1) >= 0) ? $clog2(($clog2((32 >> 3)) + 1)) : (2 - $clog2(($clog2((32 >> 3)) + 1))))) + 59) - 1) >= 0) ? ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2) : (2 - ((((((7 + (((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW))) + top_pkg_TL_AIW) + top_pkg_TL_DIW) + top_pkg_TL_DW) + top_pkg_TL_DUW) + 2)))]),
				.spare_req_i(1'b0),
				.spare_req_o(),
				.spare_rsp_i(1'b0),
				.spare_rsp_o()
			);
		end
	endgenerate
	assign tl_u_o[N][(1 + (3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)))))))):(3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17)))))))] = ((tl_t_o[(1 + (3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)))))))):(3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17)))))))] & (dev_select_t == sv2v_cast_3B809(N))) & ~hold_all_requests);
	assign tl_u_o[N][(3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16))))))):(3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17))))))] = tl_t_o[(3 + (3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16))))))):(3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17))))))];
	assign tl_u_o[N][(3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)))))):((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17)))))] = tl_t_o[(3 + ((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)))))):((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17)))))];
	assign tl_u_o[N][((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16))))):(top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17))))] = tl_t_o[((((top_pkg_TL_SZW - 1) >= 0) ? top_pkg_TL_SZW : (2 - top_pkg_TL_SZW)) + (top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16))))):(top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17))))];
	assign tl_u_o[N][(top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)))):(top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17)))] = tl_t_o[(top_pkg_TL_AIW + (top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)))):(top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17)))];
	assign tl_u_o[N][(top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16))):((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17))] = tl_t_o[(top_pkg_TL_AW + ((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16))):((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 17))];
	assign tl_u_o[N][((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)):(top_pkg_TL_DW + 17)] = tl_t_o[((((top_pkg_TL_DBW - 1) >= 0) ? top_pkg_TL_DBW : (2 - top_pkg_TL_DBW)) + (top_pkg_TL_DW + 16)):(top_pkg_TL_DW + 17)];
	assign tl_u_o[N][(top_pkg_TL_DW + 16):17] = tl_t_o[(top_pkg_TL_DW + 16):17];
	assign tl_u_o[N][16:1] = tl_t_o[16:1];
	tlul_err_resp err_resp(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.tl_h_i(tl_u_o[N]),
		.tl_h_o(tl_u_i[N])
	);
	function automatic [(NWD - 1):0] sv2v_cast_3B809;
		input reg [(NWD - 1):0] inp;
		sv2v_cast_3B809 = inp;
	endfunction
endmodule