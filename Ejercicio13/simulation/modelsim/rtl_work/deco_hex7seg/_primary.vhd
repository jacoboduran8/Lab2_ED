library verilog;
use verilog.vl_types.all;
entity deco_hex7seg is
    port(
        iA              : in     vl_logic_vector(3 downto 0);
        oSeg            : out    vl_logic_vector(6 downto 0)
    );
end deco_hex7seg;
