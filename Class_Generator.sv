class Generator extends Component;

Driver drv_h;
Transaction trn_h;
Scoreboard scb_h;

function new(Driver drv_h, Scoreboard scb_h);

this.drv_h = drv_h;
this.scb_h = scb_h;
this.trn_h = new();

endfunction

virtual task run(int n);
repeat (n) 
begin
// trn_h.b_value.constraint_mode(0); // Step 8
if (!trn_h.randomize()) $fatal(1, “Transaction: :randomize() failed");
// if (!trn_h.randomize() with {operand_b inside {[-3:3]}; }) $fatal(1, “Transaction: :randomize() failed"); //step 7
ff trn_h.b_value.constraint_mode(1); // Step 8

this.send(trn_h);

trn_h.print_transaction();

end
endtask

virtual task send(Transaction trn_h);

scb_h.save_transaction(trn_h);
drv_h.send(trn_h);

endtask
endclass : Generator