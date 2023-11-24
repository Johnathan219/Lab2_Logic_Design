
module matrix_multiply(
  input wire clk,
  input wire rst,
  input logic [7:0] romA_qa,
  input logic [7:0] romA_qb,
  input logic [7:0] romB_qa,
  input logic [7:0] romB_qb, 
  output reg [16:0] result  
);

	reg [15:0] result1, result2;
	reg [13:0] count;
	
	multiplier_8816 a1 (romA_qa, romB_qa, result1);
	multiplier_8816 a2 (romA_qb, romB_qb, result2);
	
	always_ff @(posedge clk or negedge rst) begin
		if (!rst) begin 
			result <= 17'd0;
			count <= 14'd0;
		end
		else begin 
			if (count <= 14'd513) begin
				result <= result1 + result2;
				count <= count + 14'd1;
				end
			else if (count > 14'd513) begin
				result <= result;
				count <= count;
				end
		end
	end
endmodule
