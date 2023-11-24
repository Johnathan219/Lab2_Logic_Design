	module accumulate_romC (
	input wire clk,
	input wire reset,
	input wire [15:0] romC_qa,
	input wire [15:0] romC_qb,
	output wire [23:0] result
);

	reg [23:0] result_tmp;
	reg [23:0] count;
	always_ff @(posedge clk or negedge reset) begin
		if (!reset) begin 
			result_tmp <= 24'd0;
			count <= 24'd0;
		end
		else if (count <= 24'd129) begin
			result_tmp <=  romC_qa + romC_qb;
			count <= count + 24'd2;
			end
		else if (count > 24'd129) begin 
			result_tmp <= 24'd0;
			count <= count + 24'd2;
		end
	end 
	assign result = result_tmp;
endmodule

			