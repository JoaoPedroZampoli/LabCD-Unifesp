module ContadorCresc (
    input  KEY0,
    input  SW0,
    output [6:0] HEX3
);

    wire [3:0] fios_contagem; // Fio que liga o contador ao decodificador

    Contador (
        .clk(KEY0),
        .rst(SW0),
        .q(fios_contagem)
    );

    DecodificadorBCD (
        .W(fios_contagem[3]), // Bit mais significativo (8)
        .X(fios_contagem[2]), // (4)
        .Y(fios_contagem[1]), // (2)
        .Z(fios_contagem[0]), // Bit menos significativo (1)
       
        .a(HEX3[0]),
        .b(HEX3[1]),
        .c(HEX3[2]),
        .d(HEX3[3]),
        .e(HEX3[4]),
        .f(HEX3[5]),
        .g(HEX3[6])
    );

endmodule