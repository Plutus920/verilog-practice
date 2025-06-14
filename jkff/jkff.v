module jkff(	input j,
				input k,
				input clk,
				input rst_n, 		//active-low asynchronous reset
				output reg q);
 

	always@(posedge clk or negedge rst_n) begin
		if(!rst_n)
			q <= 1'b0; 
		else begin
			case({j,k})
			2'b00: q <= q;
			2'b01: q <= 0; 
			2'b10: q <= 1;
			2'b11: q <= ~q;
			endcase
		end
	end
endmodule