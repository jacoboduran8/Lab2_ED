library verilog;
use verilog.vl_types.all;
entity deco_error is
    port(
        iErr            : in     vl_logic;
        oSeg            : out    vl_logic_vector(6 downto 0)
    );
end deco_error;
