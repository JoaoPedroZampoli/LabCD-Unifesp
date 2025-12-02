module Contador (
    input clk,
    input rst,
    output reg [3:0] q
);
    always @(posedge clk) begin
        if (rst) begin
            q <= 4'b0000;     // Reset síncrono
        end else begin
            if (q == 4'd9)
                q <= 4'b0000; // Reiniciando após o 9
            else
                q <= q + 1'b1;
        end
    end
endmodule