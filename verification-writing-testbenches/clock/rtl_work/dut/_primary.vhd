library verilog;
use verilog.vl_types.all;
entity dut is
    port(
        clk             : in     vl_logic;
        q               : out    vl_logic
    );
end dut;
