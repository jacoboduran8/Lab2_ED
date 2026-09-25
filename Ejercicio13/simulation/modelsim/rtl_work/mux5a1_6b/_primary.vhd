library verilog;
use verilog.vl_types.all;
entity mux5a1_6b is
    port(
        iSel            : in     vl_logic_vector(2 downto 0);
        iD0             : in     vl_logic_vector(5 downto 0);
        iD1             : in     vl_logic_vector(5 downto 0);
        iD2             : in     vl_logic_vector(5 downto 0);
        iD3             : in     vl_logic_vector(5 downto 0);
        iD4             : in     vl_logic_vector(5 downto 0);
        oY              : out    vl_logic_vector(5 downto 0)
    );
end mux5a1_6b;
