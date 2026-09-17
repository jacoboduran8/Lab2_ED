library verilog;
use verilog.vl_types.all;
entity deco_bcd7seg is
    port(
        iA              : in     vl_logic_vector(3 downto 0);
        iErr            : in     vl_logic;
        oSeg            : out    vl_logic_vector(6 downto 0)
    );
end deco_bcd7seg;
