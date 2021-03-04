interface tb_ifc (input logic clk);

timeunit 1ns; timeprecision 1ns;
// user-defined types are defined in instr_register_pkg.sv

import instr_register_pkg: :*;

// ADD CODE TO DECLARE THE INTERFACE SIGNALS AND A TESTBENCH MODPORT

logic load_en;
logic reset_n;

opcode_t opcode;
operand_t operand_a, operand_b;

address_t write_pointer, read_pointer;
instruction_t instruction_word;

modport tb (output load_en, reset_n, opcode, operand_a, operand_b,
write_pointer, read_pointer,input clk, instruction_word) ;

endinterface: tb_ifc
