library verilog;
use verilog.vl_types.all;
entity Ejercicio12 is
    port(
        iBCD            : in     vl_logic_vector(3 downto 0);
        oLED            : out    vl_logic_vector(3 downto 0);
        oHEX1           : out    vl_logic_vector(6 downto 0);
        oHEX5           : out    vl_logic_vector(6 downto 0)
    );
end Ejercicio12;
