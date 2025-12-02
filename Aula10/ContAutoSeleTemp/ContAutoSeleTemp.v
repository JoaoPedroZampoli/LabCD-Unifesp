module ContAutoSeleTemp(
	input clock50,
	input sw17,
	input sw16,
	input sw0,
	output [6:0] HEX1
);

	wire w_05, w_1, w_2, w_6; // Fios para receber os clocks
   wire clk_selecionado;     // Fio que sai do Mux
   wire [3:0] fios_contagem;

	GeradorDeFrequencias(
		  .clk_in(clock50),
		  .clk_05s(w_05),
		  .clk_1s(w_1),
		  .clk_2s(w_2),
		  .clk_6s(w_6)
	 );
		 
	 Mux (
        .sel1(sw17), 
        .sel0(sw16),
        .c0(w_05), 
        .c1(w_1), 
        .c2(w_2), 
        .c3(w_6),
        .clk_saida(clk_selecionado)
    );
	 
	 Contador(
		.clk(clk_selecionado),
		.rst(sw0),
		.q(fios_contagem)
	 );

	DecodificadorBCD (
		  .W(fios_contagem[3]), // Bit mais significativo (8)
		  .X(fios_contagem[2]), // (4)
		  .Y(fios_contagem[1]), // (2)
		  .Z(fios_contagem[0]), // Bit menos significativo (1)
		 
		  .a(HEX1[0]),
		  .b(HEX1[1]),
		  .c(HEX1[2]),
		  .d(HEX1[3]),
		  .e(HEX1[4]),
		  .f(HEX1[5]),
		  .g(HEX1[6])
	);


endmodule