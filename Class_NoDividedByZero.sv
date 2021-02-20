class NoDivideByZero extends Transaction;

constraint no_div_by_@ {(opcode == DIV) -> (operand_b != @);}

endclass: NoDivideByZero