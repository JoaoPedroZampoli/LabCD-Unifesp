module GeradorDeFrequencias (
    input clk_in,
    output reg clk_05s, // 0.5 segundos
    output reg clk_1s,  // 1 segundo
    output reg clk_2s,  // 2 segundos
    output reg clk_6s   // 6 segundos
);

    // Contadores para cada tempo
    // Precisam ser grandes o suficiente. 28 bits alcança até 268 milhões (suficiente pros 6s)
    reg [27:0] cont_05;
    reg [27:0] cont_1;
    reg [27:0] cont_2;
    reg [27:0] cont_6;

    initial begin
        cont_05 = 0; clk_05s = 0;
        cont_1  = 0; clk_1s  = 0;
        cont_2  = 0; clk_2s  = 0;
        cont_6  = 0; clk_6s  = 0;
    end

    always @(posedge clk_in) begin
        
        // --- Lógica para 0.5s (Inverte a cada 12.500.000 ciclos) ---
        if (cont_05 == 12499999) begin
            cont_05 <= 0;
            clk_05s <= ~clk_05s;
        end else begin
            cont_05 <= cont_05 + 1;
        end

        // --- Lógica para 1s (Inverte a cada 25.000.000 ciclos) ---
        if (cont_1 == 24999999) begin
            cont_1 <= 0;
            clk_1s <= ~clk_1s;
        end else begin
            cont_1 <= cont_1 + 1;
        end

        // --- Lógica para 2s (Inverte a cada 50.000.000 ciclos) ---
        if (cont_2 == 49999999) begin
            cont_2 <= 0;
            clk_2s <= ~clk_2s;
        end else begin
            cont_2 <= cont_2 + 1;
        end

        // --- Lógica para 6s (Inverte a cada 150.000.000 ciclos) ---
        // 50MHz * 3s = 150 Milhões
        if (cont_6 == 149999999) begin
            cont_6 <= 0;
            clk_6s <= ~clk_6s;
        end else begin
            cont_6 <= cont_6 + 1;
        end

    end

endmodule