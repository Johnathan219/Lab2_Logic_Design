module counter_clock_tick (
	input logic clk,
	input logic rst,
	output logic [23:0] result);
	
	reg [23:0] tmp;
	reg [13:0] count;
	always_ff @(posedge clk or negedge rst) begin 
		if (!rst) begin
			tmp <= 24'd0;
			count <= 14'd0;
			end
		else begin
			if (count <= 14'd513) begin 
					tmp <= tmp + 1'd1;
					count <= count + 14'd1;
				end
			else if (count > 14'd513) begin
					tmp <= tmp;
					count <= count;
				end
		end
	end
	assign result = tmp; 
endmodule
			