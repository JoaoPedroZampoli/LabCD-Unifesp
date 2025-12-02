module ContadorAuto (
    input clock,
    input reset,
    output reg [3:0] q
);
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            q <= 4'b0000; 
        end else begin
            if (q == 4'd9) 
                q <= 4'b0000; // Reinicia após o 9
            else 
                q <= q + 1'b1;
        end
    end
endmodule