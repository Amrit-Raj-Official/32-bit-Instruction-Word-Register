class Scoreboard extends Component;
Transaction sent_trn[address_t];
Transaction trnh; // transaction handle for covergroup
covergroup cg_transaction;
  
// Cover write_pointer in four bins, where each bin covers one quadrant (1/4) of the address space

ADDR: coverpoint trn_h.write_pointer {
bins addr[4]={[0:$]};} // divide range into 4 bins

// Cover opcode in two bins: DIV operations, and all other operations

OPC: coverpoint trn_h.opcode {
bins div_opce = { DIV };
bins other_opc = default;
}

// Cover operand_a for values that are negative, positive, and zero

OPA: coverpoint trn_h.operand_a {
bins neg_A = {[-31:-1]};
bins zero_A = { @ };
bins pos_A = {[1:31]};
}

// Cover operand_b for values that are negative, positive, and zero

OPB: coverpoint trn_h.operand_b {
bins neg_B = {[-31:-1]};
  bins zero_B = { 0 };
bins pos_B = {[1:31]};
}

// Cover how many times a DIV operation occurs when operand_b is zero

Div_zero: cross OPC, OPB {
bins DIV_BY_ZERO = binsof(OPC.div_opc) && binsof(OPB.zero_B);
ignore_bins rest = !binsof(OPC.div_opc) || !binsof(OPB.zero_B);
}

endgroup : cg_transaction

function new();

cg_transaction = new(); // Construct cover group

endfunction

virtual function void save_transaction(Transaction trn_h);

// creates a shallow clone of trn object and stores handle to it in the array

// the LRM shallow clone syntax is used, not a user defined clone method

// In this syntax it is illegal to have parenthases after new.

sent_trn[trn_h.write_pointer]=new trn_h;

this.trn_h = trn_h;

cg_transaction.sample(); // Sample coverage

endfunction

virtual task report();

$display("\nxxxxxxe*Coverage reportrxrekaeeeee”);
$display("Covergroup coverage = %6.2f%%", cg_transaction. get_coverage());

$display("Address coverage = %6.2f%%", cg_transaction. ADDR. get_coverage());

endgroup : cg_transaction =

function new();

cg_transaction = new(); // Construct cover group

endfunction

virtual function void save_transaction(Transaction trn_h);
// creates a shallow clone of trn object and stores handle to it in the array
// the LRM shallow clone syntax is used, not a user defined clone method
// In this syntax it is illegal to have parenthases after new.

sent_trn(trn_h.write_pointer]=new trn_h;

this.trn_h = trn_h;
cg_transaction.sample(); // Sample coverage

endfunction

virtual task report();
$display("\nexxxxxxxCoverage report xxkkearenke”);

$display("Covergroup coverage = %6.2f%%", cg_transaction. get_coverage());

$display("Address coverage = %6.2f%%", cg_transaction. ADDR. get_coverage());

$display("Opcode coverage = %6.2f%X%", cg_transaction.OPC.get_coverage());

$display("Operand a coverage = %6.2f%%", cg_transaction.OPA. get_coverage());

$display("Operand b coverage = %6.2f%%", cg_transaction.OPB.get_coverage());

$display("Divide-by-zero coverage = %6.2f%%", cg_transaction.Div_zero. get_coverage());

$display("\nOverall coverage = %6.2F%%", S$eet_coverage());


endtask

endclass: Scoreboard
