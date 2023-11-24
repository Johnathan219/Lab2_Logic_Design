module counter_8192 (
		input clk,
		input reset,
		output wire [13:0] Q_a,
		output wire [13:0] Q_b
		);
		
		reg [12:0] qa, qb;
		always_ff @(posedge clk or negedge reset) begin 
			if (!reset) begin
				qa <= 12'd0;
				qb <= 12'd0;
			end 
			else begin 
				qa <= qa + 12'd1;
				qb <= qb + 12'd1;
			end
		end 
		
		assign Q_a = {qa, 1'b0};
		assign Q_b = {qb, 1'b1};
endmodule

