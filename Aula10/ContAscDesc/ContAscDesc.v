module ContAscDesc(
	input KEY3,
	input SW17,
	input SW0,
	input clock_fpga,
	output [6:0] HEX1
);

	wire [3:0] fios_contagem;
	wire button_inverted = ~KEY3;
	wire sinal_filtrado;
	
	FiltroDigital(
		.clock_fpga(clock_fpga),
		.button_input(button_inverted),
		.button_output(sinal_filtrado)
	);
	
	Contador(
		.clock(sinal_filtrado),
		.reset(SW17),
		.modo(SW0),
		.q(fios)
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