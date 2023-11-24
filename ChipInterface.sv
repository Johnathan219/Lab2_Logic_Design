module ChipInterface
  (input  logic CLOCK_50,
   input  logic SW,
   input  logic KEY0,
   output logic [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
	
// Declare the output for the counter when rising edge
	reg [6:0] Add_C;
	reg [6:0] Add_inC;
	reg [6:0] Add_B;
	reg [6:0] Add_inB;
	reg [13:0] Add_A3;
	reg [13:0] Add_inA3;
	reg [13:0] Add_A7;
	reg [13:0] Add_inA7;
	reg [13:0] Add_A11;
	reg [13:0] Add_inA11;
	reg [13:0] Add_A15;
	reg [13:0] Add_inA15;
	reg [13:0] Add_A19;
	reg [13:0] Add_inA19;
	reg [13:0] Add_A23;
	reg [13:0] Add_inA23;
	reg [13:0] Add_A27;
	reg [13:0] Add_inA27;
	reg [13:0] Add_A31;
	reg [13:0] Add_inA31;
	reg [13:0] Add_A35;
	reg [13:0] Add_inA35;
	reg [13:0] Add_A39;
	reg [13:0] Add_inA39;
	reg [13:0] Add_A43;
	reg [13:0] Add_inA43;
	reg [13:0] Add_A47;
	reg [13:0] Add_inA47;
	reg [13:0] Add_A51;
	reg [13:0] Add_inA51;
	reg [13:0] Add_A55;
	reg [13:0] Add_inA55;
	reg [13:0] Add_A59;
	reg [13:0] Add_inA59;
	reg [13:0] Add_A63;
	reg [13:0] Add_inA63;
	
// Declare the output for the ROM when rising edge
	reg [15:0] q_C;
	reg [15:0] q_inC;
	reg [7:0] q_B;
	reg [7:0] q_inB;
	reg [7:0] q_A3;
	reg [7:0] q_inA3;
	reg [7:0] q_A7;
	reg [7:0] q_inA7;
	reg [7:0] q_A11;
	reg [7:0] q_inA11;
	reg [7:0] q_A15;
	reg [7:0] q_inA15;
	reg [7:0] q_A19;
	reg [7:0] q_inA19;
	reg [7:0] q_A23;
	reg [7:0] q_inA23;
	reg [7:0] q_A27;
	reg [7:0] q_inA27;
	reg [7:0] q_A31;
	reg [7:0] q_inA31;
	reg [7:0] q_A35;
	reg [7:0] q_inA35;
	reg [7:0] q_A39;
	reg [7:0] q_inA39;
	reg [7:0] q_A43;
	reg [7:0] q_inA43;
	reg [7:0] q_A47;
	reg [7:0] q_inA47;
	reg [7:0] q_A51;
	reg [7:0] q_inA51;
	reg [7:0] q_A55;
	reg [7:0] q_inA55;
	reg [7:0] q_A59;
	reg [7:0] q_inA59;
	reg [7:0] q_A63;
	reg [7:0] q_inA63;
	
// Declare the output for the matrix multiply 
	reg [16:0] result_tmp4;
	reg [16:0] result_tmp8;
	reg [16:0] result_tmp12;
	reg [16:0] result_tmp16;
	reg [16:0] result_tmp20;
	reg [16:0] result_tmp24;
	reg [16:0] result_tmp28;
	reg [16:0] result_tmp32;	
	reg [16:0] result_tmp36;
	reg [16:0] result_tmp40;
	reg [16:0] result_tmp44;
	reg [16:0] result_tmp48;
	reg [16:0] result_tmp52;
	reg [16:0] result_tmp56;
	reg [16:0] result_tmp60;
	reg [16:0] result_tmp64;
	reg [23:0] result_tmp0;
	reg [23:0] result_tmp;
	reg [23:0] result;
	reg [23:0] clock_tick;

// Declare signal when the system completely	
	reg done;
	
// Recall the counter module
	counter_64 					count_C (CLOCK_50, KEY0, Add_C, Add_inC);
	counter_64		 			count_B (CLOCK_50, KEY0, Add_B, Add_inB);	
	counter_512					count_A3 (CLOCK_50, KEY0, Add_A3, Add_inA3);
	counter_1024_main			count_A7 (CLOCK_50, KEY0, Add_A7, Add_inA7);
	counter_1536				count_A11 (CLOCK_50, KEY0, Add_A11, Add_inA11);
	counter_2048_main			count_A15 (CLOCK_50, KEY0, Add_A15, Add_inA15);
	counter_2560				count_A19 (CLOCK_50, KEY0, Add_A19, Add_inA19);
	counter_3072_main			count_A23 (CLOCK_50, KEY0, Add_A23, Add_inA23);
	counter_3584				count_A27 (CLOCK_50, KEY0, Add_A27, Add_inA27);
	counter_4096_main			count_A31 (CLOCK_50, KEY0, Add_A31, Add_inA31);
	counter_4608				count_A35 (CLOCK_50, KEY0, Add_A35, Add_inA35);
	counter_5120_main			count_A39 (CLOCK_50, KEY0, Add_A39, Add_inA39);
	counter_5632				count_A43 (CLOCK_50, KEY0, Add_A43, Add_inA43);
	counter_6144_main			count_A47 (CLOCK_50, KEY0, Add_A47, Add_inA47);
	counter_6656				count_A51 (CLOCK_50, KEY0, Add_A51, Add_inA51);
	counter_7168_main			count_A55 (CLOCK_50, KEY0, Add_A55, Add_inA55);
	counter_7680				count_A59 (CLOCK_50, KEY0, Add_A59, Add_inA59);
	counter_8192_main			count_A63 (CLOCK_50, KEY0, Add_A63, Add_inA63);
	
// Recall ROMA, ROMB, and ROMC to read the data 
	romC_128x1			matrixC		(Add_C, Add_inC, CLOCK_50, q_C, q_inC);
	romB_128x1			matrixB 		(Add_B, Add_inB, CLOCK_50, q_B, q_inB);
	romA_128x128		matrixA3 	(Add_A3, Add_inA3, CLOCK_50, q_A3, q_inA3);
	romA_128x128		matrixA7 	(Add_A7, Add_inA7, CLOCK_50, q_A7, q_inA7);
	romA_128x128		matrixA11 	(Add_A11, Add_inA11, CLOCK_50, q_A11, q_inA11);
	romA_128x128		matrixA15 	(Add_A15, Add_inA15, CLOCK_50, q_A15, q_inA15);
	romA_128x128		matrixA19 	(Add_A19, Add_inA19, CLOCK_50, q_A19, q_inA19);
	romA_128x128		matrixA23 	(Add_A23, Add_inA23, CLOCK_50, q_A23, q_inA23);
	romA_128x128		matrixA27 	(Add_A27, Add_inA27, CLOCK_50, q_A27, q_inA27);
	romA_128x128		matrixA31 	(Add_A31, Add_inA31, CLOCK_50, q_A31, q_inA31);
	romA_128x128		matrixA35 	(Add_A35, Add_inA35, CLOCK_50, q_A35, q_inA35);
	romA_128x128		matrixA39 	(Add_A39, Add_inA39, CLOCK_50, q_A39, q_inA39);
	romA_128x128		matrixA43 	(Add_A43, Add_inA43, CLOCK_50, q_A43, q_inA43);
	romA_128x128		matrixA47 	(Add_A47, Add_inA47, CLOCK_50, q_A47, q_inA47);
	romA_128x128		matrixA51 	(Add_A51, Add_inA51, CLOCK_50, q_A51, q_inA51);
	romA_128x128		matrixA55 	(Add_A55, Add_inA55, CLOCK_50, q_A55, q_inA55);
	romA_128x128		matrixA59 	(Add_A59, Add_inA59, CLOCK_50, q_A59, q_inA59);
	romA_128x128		matrixA63 	(Add_A63, Add_inA63, CLOCK_50, q_A63, q_inA63);
	
// Calculate the sum of data from ROMC until the clock is 128th
	accumulate_romC	eqC			(CLOCK_50, KEY0, q_C, q_inC, result_tmp0);
	
// calculate the matrix then assigning to the tmp variable
	matrix_multiply	eqAxB3		(CLOCK_50, KEY0, q_A3, q_inA3, q_B, q_inB, result_tmp4);
	matrix_multiply	eqAxB7		(CLOCK_50, KEY0, q_A7, q_inA7, q_B, q_inB, result_tmp8);
	matrix_multiply	eqAxB11		(CLOCK_50, KEY0, q_A11, q_inA11, q_B, q_inB, result_tmp12);
	matrix_multiply	eqAxB15		(CLOCK_50, KEY0, q_A15, q_inA15, q_B, q_inB, result_tmp16);
	matrix_multiply	eqAxB19		(CLOCK_50, KEY0, q_A19, q_inA19, q_B, q_inB, result_tmp20);
	matrix_multiply	eqAxB23		(CLOCK_50, KEY0, q_A23, q_inA23, q_B, q_inB, result_tmp24);
	matrix_multiply	eqAxB27		(CLOCK_50, KEY0, q_A27, q_inA27, q_B, q_inB, result_tmp28);
	matrix_multiply	eqAxB31		(CLOCK_50, KEY0, q_A31, q_inA31, q_B, q_inB, result_tmp32);
	matrix_multiply	eqAxB35		(CLOCK_50, KEY0, q_A35, q_inA35, q_B, q_inB, result_tmp36);
	matrix_multiply	eqAxB39		(CLOCK_50, KEY0, q_A39, q_inA39, q_B, q_inB, result_tmp40);
	matrix_multiply	eqAxB43		(CLOCK_50, KEY0, q_A43, q_inA43, q_B, q_inB, result_tmp44);
	matrix_multiply	eqAxB47		(CLOCK_50, KEY0, q_A47, q_inA47, q_B, q_inB, result_tmp48);
	matrix_multiply	eqAxB51		(CLOCK_50, KEY0, q_A51, q_inA51, q_B, q_inB, result_tmp52);
	matrix_multiply	eqAxB55		(CLOCK_50, KEY0, q_A55, q_inA55, q_B, q_inB, result_tmp56);
	matrix_multiply	eqAxB59		(CLOCK_50, KEY0, q_A59, q_inA59, q_B, q_inB, result_tmp60);
	matrix_multiply	eqAxB63		(CLOCK_50, KEY0, q_A63, q_inA63, q_B, q_inB, result_tmp64);
	
// Accumualte all the variable from the matrix
	accumulate_all		eq				(CLOCK_50, KEY0, result_tmp0, 
											result_tmp4,
											result_tmp8, result_tmp12,
											result_tmp16,
											result_tmp20, result_tmp24, 
											result_tmp28,  
											result_tmp32, result_tmp36, 
											result_tmp40,
											result_tmp44, result_tmp48, 
											result_tmp52, 
											result_tmp56, result_tmp60,
											result_tmp64, 
											done, result_tmp);
											
// Calculate the total clock cycle for completing the system 
	counter_clock_tick clockTick	(CLOCK_50, KEY0, clock_tick);

// Select the result to display on the 7 segment
	mux2to1 				 sum			(result_tmp, clock_tick, SW, result);
	
// Binary to hex display
	bcdtohex h5 (result[23:20], HEX5);
	bcdtohex h4 (result[19:16], HEX4);
	bcdtohex h3 (result[15:12], HEX3);
	bcdtohex h2 (result[11:8], HEX2);
	bcdtohex h1 (result[7:4], HEX1);
	bcdtohex h0 (result[3:0], HEX0);

	
endmodule:ChipInterface