module prim_secded_39_32_enc (
	in,
	out
);
	input [31:0] in;
	output wire [38:0] out;
	assign out[0] = in[0];
	assign out[1] = in[1];
	assign out[2] = in[2];
	assign out[3] = in[3];
	assign out[4] = in[4];
	assign out[5] = in[5];
	assign out[6] = in[6];
	assign out[7] = in[7];
	assign out[8] = in[8];
	assign out[9] = in[9];
	assign out[10] = in[10];
	assign out[11] = in[11];
	assign out[12] = in[12];
	assign out[13] = in[13];
	assign out[14] = in[14];
	assign out[15] = in[15];
	assign out[16] = in[16];
	assign out[17] = in[17];
	assign out[18] = in[18];
	assign out[19] = in[19];
	assign out[20] = in[20];
	assign out[21] = in[21];
	assign out[22] = in[22];
	assign out[23] = in[23];
	assign out[24] = in[24];
	assign out[25] = in[25];
	assign out[26] = in[26];
	assign out[27] = in[27];
	assign out[28] = in[28];
	assign out[29] = in[29];
	assign out[30] = in[30];
	assign out[31] = in[31];
	assign out[32] = ((((((((((((in[2] ^ in[3]) ^ in[7]) ^ in[8]) ^ in[14]) ^ in[15]) ^ in[16]) ^ in[18]) ^ in[19]) ^ in[23]) ^ in[24]) ^ in[28]) ^ in[29]);
	assign out[33] = (((((((((((((in[3] ^ in[6]) ^ in[8]) ^ in[12]) ^ in[13]) ^ in[15]) ^ in[17]) ^ in[19]) ^ in[21]) ^ in[25]) ^ in[27]) ^ in[29]) ^ in[30]) ^ in[31]);
	assign out[34] = (((((((((((((in[0] ^ in[5]) ^ in[7]) ^ in[9]) ^ in[10]) ^ in[12]) ^ in[13]) ^ in[15]) ^ in[16]) ^ in[22]) ^ in[23]) ^ in[26]) ^ in[27]) ^ in[31]);
	assign out[35] = (((((((((((((in[0] ^ in[1]) ^ in[4]) ^ in[6]) ^ in[9]) ^ in[11]) ^ in[12]) ^ in[14]) ^ in[22]) ^ in[23]) ^ in[25]) ^ in[28]) ^ in[29]) ^ in[30]);
	assign out[36] = (((((((((((in[0] ^ in[2]) ^ in[3]) ^ in[4]) ^ in[5]) ^ in[11]) ^ in[17]) ^ in[20]) ^ in[24]) ^ in[26]) ^ in[27]) ^ in[30]);
	assign out[37] = (((((((((((((in[1] ^ in[2]) ^ in[4]) ^ in[6]) ^ in[10]) ^ in[13]) ^ in[14]) ^ in[16]) ^ in[18]) ^ in[19]) ^ in[20]) ^ in[21]) ^ in[22]) ^ in[26]);
	assign out[38] = ((((((((((((((in[1] ^ in[5]) ^ in[7]) ^ in[8]) ^ in[9]) ^ in[10]) ^ in[11]) ^ in[17]) ^ in[18]) ^ in[20]) ^ in[21]) ^ in[24]) ^ in[25]) ^ in[28]) ^ in[31]);
endmodule