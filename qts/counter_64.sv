module counter_64 (
		input logic clk,
		input logic reset,
		output logic [6:0] Q_a,
		output logic [6:0] Q_b
		);
		
		logic [5:0] qa, qb;
		always_ff @(posedge clk or negedge reset) begin 
			if (!reset) begin
				qa <= 6'd0;
				qb <= 6'd0;
			end 
			else begin 
				qa <= qa + 6'd1;
				qb <= qb + 6'd1;
			end
		end 
		
		assign Q_a = {qa, 1'b0};
		assign Q_b = {qb, 1'b1};
endmodule
				
				
				