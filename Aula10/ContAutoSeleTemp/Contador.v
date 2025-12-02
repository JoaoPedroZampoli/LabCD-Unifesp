module Contador (
    input clk,
    input rst,
    output reg [3:0] q
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 4'b0000; 
        end else begin
            if (q == 4'd7) 
                q <= 4'b0000; // Reinicia após o 7
            else 
                q <= q + 1'b1;
        end
    end
endmodule