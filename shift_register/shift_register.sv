module shift_register
(
	input logic		clk,
	input logic		rstn,
	input logic [1:0]	ctrl,
	input logic [7:0]	par_in,
	input logic		ser_in,

	output logic [7:0]	par_out,
	output logic		ser_out
);

always_ff@ (posedge clk, negedge rstn)
begin
		if(rstn == 1'b0)
			begin
			par_out <= 8'b00000000;
			ser_out <= 1'b0;
			end
		else
			case(ctrl)
				2'b00: begin 
					par_out <= par_out;
					ser_out <= 1'b0;
				end	
				2'b01: begin 
					par_out <= {par_out[6:0],ser_in};
					ser_out <= par_out[7];
				end
				2'b10: begin 
					par_out <= {ser_in,par_out[7:1]};
					ser_out <= par_out[0];
				end
				2'b11: begin 
					par_out <= par_in;
					ser_out <= 1'b0;
				end
				default: begin
					par_out <= 8'bxxxxxxxx;
					ser_out <= 1'bx;
				end
			endcase
end
endmodule

