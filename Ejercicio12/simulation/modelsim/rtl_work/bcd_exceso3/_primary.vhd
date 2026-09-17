library verilog;
use verilog.vl_types.all;
entity bcd_exceso3 is
    port(
        iA              : in     vl_logic_vector(3 downto 0);
        iErr            : in     vl_logic;
        oE3             : out    vl_logic_vector(3 downto 0)
    );
end bcd_exceso3;
