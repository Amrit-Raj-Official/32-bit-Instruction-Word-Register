class Transaction;

rand operand_t operand_a;
rand operand_t operand_b;
rand opcode_t opcode;
rand address_t write_pointer ;

constraint a_value {soft operand_a dist {[-31:-1]:=1, 0:=5, [1:31]:=1};}

constraint b_value {soft operand_b inside {[@:15]};}

function new();

opcode = ZERO;
operand_a = 0;
operand_b = 0;
write_pointer = 0;

endfunction

virtual function void print_transaction();

$display("Write to register location %2d: opcode = %0d (%5s) operand_a =%3d operand_b =%3d",
this.write_pointer, this.opcode, this.opcode.name(), this.operand_a, this.operand_b);

endfunction

virtual function bit compare(Transaction rhs_h);

return (this.operand_a === rhs_h.operand_a) &&
(this.operand_b === rhs_h.operand_b) &&
(this. opcode === rhs_h.opcode) &&
(this.write_pointer === rhs_h.write_pointer) ;

endfunction

endclass: Transaction