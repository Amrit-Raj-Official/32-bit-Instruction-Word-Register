module instr_register

import instr_register_pkg::*; // user-defined types are defined in instr_register_pkg.sv
(input logic clk, input logic load_en, input logic reset_n,
input operand_t operand_b, input opcode_t opcode,
input address_t write_pointer, input operand_t operand_a,
input address_t read_pointer,
output instruction_t instruction_word);

timeunit 1ns; timeprecision 1ns;

initial begin

if ($test$plusargs("monitor_register”))
$monitor("@%0t:In %m clk=%0b, reset_n=%0d, write_pointer=%0d", $realtime, clk, reset_n, write_pointer);
end
instruction_t iw_reg [0:31]; // an array of instruction_word structures

always @(posedge clk, negedge reset_n) // write into register
begin
if (!reset_n) begin

foreach (iw_reg[i])
iw_reg[i] = ‘{opc:ZERO,default:0}; // reset to all zeros
end

else if (load_en) begin
iw_reg([write_pointer] = ‘{opcode, operand_a,operand_b};
end

end

assign instruction_word = iw_reg[read_pointer]; // continuously read from register

initial begin

if ($test$plusargs(“FORCE_LOAD_ERROR"))
force operand_b = operand_a; // cause wrong value to be loaded into operand_b

end

endmodule: instr_register