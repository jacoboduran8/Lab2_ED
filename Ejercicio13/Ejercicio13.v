module Ejercicio13(iA, iB, iKEY, oLED, oHEX0, oHEX1);
input  [4:0] iA;        // SW[4:0]: operando A
input  [4:0] iB;        // SW[9:5]: operando B
input  [3:0] iKEY;      // KEY[3:0]: selección de operación (activos en 0)
output [5:0] oLED;      // LEDR[5:0]: resultado (LEDR5 = carry)
output [6:0] oHEX0;     // Display 1: dígito hexadecimal bajo
output [6:0] oHEX1;     // Display 2: dígito hexadecimal alto

wire [5:0] r_not, r_suma, r_b, r_and, r_menor;
wire [5:0] resultado;

// Las cinco operaciones se calculan en paralelo
op_not      IC01(.iA(iA), .oY(r_not));
sumador5    IC02(.iA(iA), .iB(iB), .oY(r_suma));
op_transfer IC03(.iB(iB), .oY(r_b));
op_and      IC04(.iA(iA), .iB(iB), .oY(r_and));
comparador5 IC05(.iA(iA), .iB(iB), .oY(r_menor));

// El selector escoge cuál se muestra
selector_op IC06(.iKEY(iKEY), .iNot(r_not), .iSuma(r_suma), .iBb(r_b),
                 .iAnd(r_and), .iMenor(r_menor), .oY(resultado));

assign oLED = resultado;

deco_hex7seg IC07(.iA(resultado[3:0]),          .oSeg(oHEX0));
deco_hex7seg IC08(.iA({2'b00, resultado[5:4]}), .oSeg(oHEX1));
endmodule

// Ítem 8: NOT bit a bit. F = A' (carry = 0)
module op_not(iA, oY);
input  [4:0] iA;
output [5:0] oY;
assign oY = {1'b0, ~iA};
endmodule

// Ítem 2: SUMADOR de 5 bits. {Cout, F} = A + B
module sumador5(iA, iB, oY);
input  [4:0] iA, iB;
output [5:0] oY;
assign oY = iA + iB;    // oY[5] es el carry out
endmodule

// Ítem 7: TRANSFERENCIA. F = B (carry = 0)
module op_transfer(iB, oY);
input  [4:0] iB;
output [5:0] oY;
assign oY = {1'b0, iB};
endmodule

// Ítem C: AND bit a bit. F = A · B (carry = 0)
module op_and(iA, iB, oY);
input  [4:0] iA, iB;
output [5:0] oY;
assign oY = {1'b0, iA & iB};
endmodule

// Ítem E: COMPARADOR. F = 1 si A < B, si no F = 0
module comparador5(iA, iB, oY);
input  [4:0] iA, iB;
output [5:0] oY;
assign oY = {5'b00000, (iA < iB)};
endmodule

// SELECTOR DE OPERACIÓN con prioridad
// Los pulsadores entregan 0 al oprimirse. Si no se oprime ninguno, F = A'.
module selector_op(iKEY, iNot, iSuma, iBb, iAnd, iMenor, oY);
input  [3:0] iKEY;
input  [5:0] iNot, iSuma, iBb, iAnd, iMenor;
output [5:0] oY;
assign oY = (iKEY[0] == 1'b0) ? iSuma  :   // KEY0 -> ítem 2
            (iKEY[1] == 1'b0) ? iBb    :   // KEY1 -> ítem 7
            (iKEY[2] == 1'b0) ? iAnd   :   // KEY2 -> ítem C
            (iKEY[3] == 1'b0) ? iMenor :   // KEY3 -> ítem E
                                iNot   ;   // ninguno -> ítem 8
endmodule

// DECODIFICADOR HEXADECIMAL a 7 SEGMENTOS (flujo de datos)
module deco_hex7seg(iA, oSeg);
input  [3:0] iA;
output [6:0] oSeg;                         // g f e d c b a
assign oSeg = (iA == 4'h0) ? 7'b1000000 :
              (iA == 4'h1) ? 7'b1111001 :
              (iA == 4'h2) ? 7'b0100100 :
              (iA == 4'h3) ? 7'b0110000 :
              (iA == 4'h4) ? 7'b0011001 :
              (iA == 4'h5) ? 7'b0010010 :
              (iA == 4'h6) ? 7'b0000010 :
              (iA == 4'h7) ? 7'b1111000 :
              (iA == 4'h8) ? 7'b0000000 :
              (iA == 4'h9) ? 7'b0011000 :
              (iA == 4'hA) ? 7'b0001000 :
              (iA == 4'hB) ? 7'b0000011 :
              (iA == 4'hC) ? 7'b1000110 :
              (iA == 4'hD) ? 7'b0100001 :
              (iA == 4'hE) ? 7'b0000110 :
                             7'b0001110 ;  // F
endmodule