`timescale 1ns/1ps
// Testbench Ejercicio 13: dos casos por cada operación (10 casos, 10 ns c/u)
module tb_Ejercicio13;
reg  [4:0] iA, iB;
reg  [3:0] iKEY;
wire [5:0] oLED;
wire [6:0] oHEX0, oHEX1;

Ejercicio13 DUT(.iA(iA), .iB(iB), .iKEY(iKEY),
                .oLED(oLED), .oHEX0(oHEX0), .oHEX1(oHEX1));

initial begin
  // Ítem 8: F = A'  (ningún pulsador oprimido)
  iKEY = 4'b1111; iA = 5'b01010; iB = 5'b00000; #10;
  iKEY = 4'b1111; iA = 5'b00000; iB = 5'b00000; #10;
  // Ítem 2: F = A + B  (KEY0 oprimido)
  iKEY = 4'b1110; iA = 5'b10110; iB = 5'b01101; #10;
  iKEY = 4'b1110; iA = 5'b00111; iB = 5'b00011; #10;
  // Ítem 7: F = B  (KEY1 oprimido)
  iKEY = 4'b1101; iA = 5'b00000; iB = 5'b11001; #10;
  iKEY = 4'b1101; iA = 5'b11111; iB = 5'b00100; #10;
  // Ítem C: F = A · B  (KEY2 oprimido)
  iKEY = 4'b1011; iA = 5'b11100; iB = 5'b10110; #10;
  iKEY = 4'b1011; iA = 5'b01111; iB = 5'b10000; #10;
  // Ítem E: F = (A < B)  (KEY3 oprimido)
  iKEY = 4'b0111; iA = 5'b00101; iB = 5'b01001; #10;
  iKEY = 4'b0111; iA = 5'b11000; iB = 5'b00110; #10;
  $stop;
end
endmodule