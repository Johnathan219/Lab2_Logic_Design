//module counter_2048_main (
//		input clk,
//		input reset,
//		output wire [13:0] Q_a,
//		output wire [13:0] Q_b
//		);
//		
//		reg [12:0] qa, qb;
//		reg [13:0] counter;
//		always_ff @(posedge clk or negedge reset) begin 
//			if (!reset) begin
//				qa <= 13'd1920;
//				qb <= 13'd1920;
//				counter <= 14'd1920;
//			end 
//			else if (counter < 14'd2048) begin 
//				qa <= qa + 13'd1;
//				qb <= qb + 13'd1;
//				counter <= counter + 14'd1;
//			end
//		end 
//		
//		assign Q_a = {qa, 1'b0};
//		assign Q_b = {qb, 1'b1};
//endmodule

module counter_2048_main (
		input clk,
		input reset,
		output wire [13:0] Q_a,
		output wire [13:0] Q_b
		);
		
		reg [12:0] qa, qb;
		reg [13:0] counter;
		always_ff @(posedge clk or negedge reset) begin 
			if (!reset) begin
				qa <= 13'd1536;
				qb <= 13'd1536;
				counter <= 14'd1536;
			end 
			else if (counter < 14'd2048) begin 
				qa <= qa + 13'd1;
				qb <= qb + 13'd1;
				counter <= counter + 14'd1;
			end
		end 
		
		assign Q_a = {qa, 1'b0};
		assign Q_b = {qb, 1'b1};
endmodule
