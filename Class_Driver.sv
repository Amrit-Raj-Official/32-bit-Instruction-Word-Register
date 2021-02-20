class Driver extends Component;

virtual tb_ife v_io;
function new(virtual tb_ife v_io);
this.v_io = v_io;

endfunction

virtual task reset();
v_io.write_pointer <= 5'he@; // initialize write pointer
v_io.read_pointer <= 5'hlF; // initialize read pointer
v_io.load_en <= 1'bé@; // initialize load control line
v_io.reset_n <= 1'b@; // assert reset_n (active low) - should be non-blocking
repeat (2) @(posedge v_io.clk) ; // hold in reset for 2 clock cycles
v_io.reset_n <= 1’bl; // deassert reset_n (active low)

endtask : reset

virtual task send(Transaction trn_h);
@(posedge v_io.clk)
#1 v_io.load_en = 1'bl; // enable writing to register
v_io.operand_a <= trn_h.operand_a;
v_io.operand_b <= trn_h.operand_b;
v_io.opcode <= trn_h.opcode;
v_io.write_pointer <= trn_h.write_pointer;
@(posedge v_io.clk)
#1 v_io.load_en = 1'b@; // turn-off writing to register

endtask : send
endclass: Driver