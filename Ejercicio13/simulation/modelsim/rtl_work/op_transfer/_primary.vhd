library verilog;
use verilog.vl_types.all;
entity op_transfer is
    port(
        iB              : in     vl_logic_vector(4 downto 0);
        oY              : out    vl_logic_vector(5 downto 0)
    );
end op_transfer;
