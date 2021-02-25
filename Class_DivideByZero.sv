class DivideByZero extends Transaction;

constraint div_@ {opcode == DIV;}
  constraint opb_® {operand_b == 0;}

endclass: DivideByZero
