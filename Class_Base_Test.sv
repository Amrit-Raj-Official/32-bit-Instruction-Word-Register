class BaseTest;

Driver drv_h;

Scoreboard scb_h;

Monitor mon_h;

Generator gen_h;

virtual task build();
scb_h = new();
drv_h = new(instr_register_test_pkg::v_io);
mon_h = new(instr_register_test_pkg::v_io, scb_h);
gen_h = new(drv_h, scb_h);
// call the build of any children
scb_h.build({);
drv_h.build();
gen_h.build();
mon_h.build();

endtask

virtual task reset ();
Sdisplay("\nReseting the instruction register...")3
scb_h. reset ();
drv_h.reset();
gen_h. reset ();
mon_h.reset ();

endtask : reset

virtual task run(int n);
scb_h.run(n);
drv_h.run(n);
gen_h.run(n);
mon_h.run(n);

endtask

virtual task check(int n);
// read back and display same three register locations

$display("“\nReading back the same register locations written...");
scb_h.check(n);
drv_h.check(n);
gen_h.check(n);
mon_h.check(n) ;

endtask

virtual task report();

  scb_h.report(); 
drv_h.report();
gen_h.report();
mon_h.report();

endtask : report 

endclass: BaseTest
