
module Ejercicio12(iBCD, oLED, oHEX1, oHEX5);
input  [3:0] iBCD;      // SW[3:0]: dígito BCD de entrada
output [3:0] oLED;      // LEDR[3:0]: código Exceso 3
output [6:0] oHEX1;     // Display 2: dígito decimal
output [6:0] oHEX5;     // Display 6: letra E cuando hay error

wire error;             // 1 cuando la entrada es mayor que 9

detector_error IC01(.iA(iBCD), .oErr(error));
bcd_exceso3    IC02(.iA(iBCD), .iErr(error), .oE3(oLED));
deco_bcd7seg   IC03(.iA(iBCD), .iErr(error), .oSeg(oHEX1));
deco_error     IC04(.iErr(error), .oSeg(oHEX5));
endmodule

// Submódulo: DETECTOR DE ERROR (entradas 1010 a 1111)
// Mapa K: Err = A3·(A2 + A1)
module detector_error(iA, oErr);
input  [3:0] iA;
output       oErr;
assign oErr = iA[3] & (iA[2] | iA[1]);
endmodule

// Submódulo: CONVERSOR BCD a EXCESO 3 (mapas K con condiciones no importa)
//   E3 = A3 + A2·(A1 + A0)
//   E2 = A2'·(A1 + A0) + A2·A1'·A0'
//   E1 = A1 XNOR A0
//   E0 = A0'
// Con error los LEDs se apagan.
module bcd_exceso3(iA, iErr, oE3);
input  [3:0] iA;
input        iErr;
output [3:0] oE3;
wire   [3:0] e3;
assign e3[3] = iA[3] | (iA[2] & (iA[1] | iA[0]));
assign e3[2] = (~iA[2] & (iA[1] | iA[0])) | (iA[2] & ~iA[1] & ~iA[0]);
assign e3[1] = ~(iA[1] ^ iA[0]);
assign e3[0] = ~iA[0];
assign oE3   = e3 & {4{~iErr}};
endmodule

// Submódulo: DECODIFICADOR BCD a 7 SEGMENTOS (flujo de datos)
// Con error el display se apaga.
module deco_bcd7seg(iA, iErr, oSeg);
input  [3:0] iA;
input        iErr;
output [6:0] oSeg;                    // g f e d c b a
assign oSeg = iErr         ? 7'b1111111 :  // Apagado
              (iA == 4'd0) ? 7'b1000000 :  // 0
              (iA == 4'd1) ? 7'b1111001 :  // 1
              (iA == 4'd2) ? 7'b0100100 :  // 2
              (iA == 4'd3) ? 7'b0110000 :  // 3
              (iA == 4'd4) ? 7'b0011001 :  // 4
              (iA == 4'd5) ? 7'b0010010 :  // 5
              (iA == 4'd6) ? 7'b0000010 :  // 6
              (iA == 4'd7) ? 7'b1111000 :  // 7
              (iA == 4'd8) ? 7'b0000000 :  // 8
                             7'b0011000 ;  // 9
endmodule

// Submódulo: DISPLAY DE ERROR. Muestra "E" (segmentos a, d, e, f, g)
module deco_error(iErr, oSeg);
input        iErr;
output [6:0] oSeg;                    // g f e d c b a
assign oSeg = iErr ? 7'b0000110 : 7'b1111111;
endmodule