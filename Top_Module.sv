module top();

timeunit 1ns; timeprecision lns;

initial $timeformat(-9,®@, "ns", 3);
// user-defined types are defined in instr_register_pkg.sv

import instr_register_test_pkg: :*;

// clock variables

logic clk;

int num_trans = 3;

BaseTest test_h;

tb_ife io (.clk(clk));

// connect interface to testbench removed

//instr_register_test test (.io(io));

// instantiate design and connect ports

instr_register dut (
.clk(clk),
. load_en(io. load_en),
.reset_n(io.reset_n),
.operand_a(io.operand_a),
.operand_b(io.operand_b),
.opcode(io. opcode),
.write_pointer(io.write_pointer),
.read_pointer(io.read_pointer),
.instruction_word(io. instruction_word)
);

// clock oscillator
initial begin
clk <= @;

forever #5 clk = ~clk;
end
initial begin
if ($value$plusargs(“num_trans=%d", num_trans))
$display("\n+num_trans=%0d found", num_trans);

else

$display("\nNo +num_trans found, using default of %@d", num_trans);

instr_register_test_pkg::v_io = io;
test_h = new();
test_h.build();
test_h.reset();
test_h.run(num_trans) ;
test_h.check(num_trans) ;
test_h.report();

$finish;

end

endmodule: top
