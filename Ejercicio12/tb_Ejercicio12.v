`timescale 1ns/1ps
// Testbench Ejercicio 12: recorre las 16 combinaciones de SW[3:0]
module tb_Ejercicio12;
reg  [3:0] iBCD;
wire [3:0] oLED;
wire [6:0] oHEX1, oHEX5;
integer i;

Ejercicio12 DUT(.iBCD(iBCD), .oLED(oLED), .oHEX1(oHEX1), .oHEX5(oHEX5));

initial begin
  for (i = 0; i < 16; i = i + 1) begin
    iBCD = i; #10;
  end
  $stop;
end
endmodule