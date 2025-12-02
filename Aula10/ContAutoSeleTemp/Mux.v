module Mux (
    input sel1, sel0,       // Chaves de seleção (SW17, SW16)
    input c0, c1, c2, c3,   // As 4 entradas de clock
    output reg clk_saida    // O clock selecionado
);
    always @(*) begin
        case ({sel1, sel0}) // Concatena SW17 e SW16
            2'b00: clk_saida = c0; // 0.5 segundos
            2'b01: clk_saida = c1; // 1 segundo
            2'b10: clk_saida = c2; // 2 segundos
            2'b11: clk_saida = c3; // 6 segundos
            default: clk_saida = c0;
        endcase
    end
endmodule