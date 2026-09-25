library verilog;
use verilog.vl_types.all;
entity Ejercicio13 is
    port(
        iA              : in     vl_logic_vector(4 downto 0);
        iB              : in     vl_logic_vector(4 downto 0);
        iKEY            : in     vl_logic_vector(2 downto 0);
        oLED            : out    vl_logic_vector(5 downto 0);
        oHEX0           : out    vl_logic_vector(6 downto 0);
        oHEX1           : out    vl_logic_vector(6 downto 0)
    );
end Ejercicio13;
