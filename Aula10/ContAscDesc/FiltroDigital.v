module FiltroDigital (
    input clock_fpga,   // Clock rápido da placa (50MHz)
    input button_input,  // Botão
    output button_output // Saída filtrada
);
    // Criando os 3 Flip-Flops do esquemático
    reg Q1, Q2, Q3;

    always @(posedge clock_fpga) begin
        Q1 <= button_input; // O primeiro FF recebe o botão
        Q2 <= Q1;        // O segundo recebe do primeiro
        Q3 <= Q2;        // O terceiro recebe do segundo
    end

    // A saída só vai para 1 se Q1, Q2 e Q3 forem 1 ao mesmo tempo
    assign button_output = Q1 & Q2 & Q3;

endmodule