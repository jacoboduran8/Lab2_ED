`timescale 1ns/1ps
module tb_Ejercicio11;
reg  [2:0] iSelect;
wire [6:0] oDisplay1, oDisplay2, oDisplay3, oDisplay4, oDisplay5, oDisplay6;
integer i;

Ejercicio11 DUT(iSelect, oDisplay1, oDisplay2, oDisplay3,
                oDisplay4, oDisplay5, oDisplay6);

initial begin
  for (i = 0; i < 8; i = i + 1) begin
    iSelect = i; #10;
  end
  $stop;
end
endmodule