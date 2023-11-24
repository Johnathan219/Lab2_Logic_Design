module accumulate_all (
	input wire clk,
	input wire reset,
	input wire [23:0] romC,
	input wire [16:0] romAxB,
	input wire [16:0] romAxB1,
	input wire [16:0] romAxB2,
	input wire [16:0] romAxB3,
	input wire [16:0] romAxB4,
	input wire [16:0] romAxB5,
	input wire [16:0] romAxB6,
	input wire [16:0] romAxB7,
	input wire [16:0] romAxB8,
	input wire [16:0] romAxB9,
	input wire [16:0] romAxB10,
	input wire [16:0] romAxB11,
	input wire [16:0] romAxB12,
	input wire [16:0] romAxB13,
	input wire [16:0] romAxB14,
	input wire [16:0] romAxB15,

	output logic done,
	output logic [23:0] function_Y
	);
	
	reg [23:0] function_tmp;
	reg [13:0] count;
	always_ff @(posedge clk or negedge reset) begin 
		if (!reset) begin
			function_tmp <= 24'd0;
			count <= 14'd0;
		end
			
		else begin
			if (count <= 14'd513) begin 
				function_tmp <= romC + romAxB + romAxB1 + romAxB2 + romAxB3 + romAxB4 + romAxB5 
									+ romAxB6 + romAxB7 + romAxB8 + romAxB9 + romAxB10 + romAxB11 + romAxB12 + romAxB13
									+ romAxB14 + romAxB15 + function_tmp;
				count <= count + 14'd1;
				done <= 1'b0;
			end 
			else if (count > 14'd513) begin
				done <= 1'b1;
				count <= count;
				function_tmp <= function_tmp;
			end
		end
	end 
	
	assign function_Y = function_tmp;
endmodule
