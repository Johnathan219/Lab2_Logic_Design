module counter_6912(
		input clk,
		input reset,
		output wire [13:0] Q_a,
		output wire [13:0] Q_b
		);
		
		reg [12:0] qa, qb;
		reg [13:0] counter;
		always_ff @(posedge clk or negedge reset) begin 
			if (!reset) begin
				qa <= 13'd6784;
				qb <= 13'd6784;
				counter <= 14'd6784;
			end 
			else if (counter < 14'd6912) begin 
				qa <= qa + 13'd1;
				qb <= qb + 13'd1;
				counter <= counter + 14'd1;
			end
		end 
		
		assign Q_a = {qa, 1'b0};
		assign Q_b = {qb, 1'b1};
endmodule
