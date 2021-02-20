class DivideByZero extends Transaction;

constraint div_@ {opcode == DIV;}
constraint opb_® {operand_b == @;}

endclass: DivideByZero