module Contador (
    input clock,
    input reset,
	 input modo,
    output reg [3:0] q
);
    always @(negedge clock or posedge reset) begin
        if (reset) begin
            q <= 4'b0000;     // Reset pra 0
        end else begin
            if (modo == 1'b1)begin
					if(q == 4'd7)
						q <= 4'd0; // Volta pro 0 depois do 7
					else
                q <= q + 1'b1;
				end else begin
					if(q == 4'd0)
						q <= 4'd7; // Volta pro 7 depois do 0
					else
						q <= q - 1'b1;
				end
        end
    end
endmodule