library verilog;
use verilog.vl_types.all;
entity op_not is
    port(
        iA              : in     vl_logic_vector(4 downto 0);
        oY              : out    vl_logic_vector(5 downto 0)
    );
end op_not;
