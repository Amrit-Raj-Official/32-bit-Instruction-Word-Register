class Monitor extends Component;

virtual tb_ife v_io;
Scoreboard scb_h;

function new(virtual tb_ifc v_io, Scoreboard scb_h);

this.v_io = v_io;
this.scb_h = scb_h;

endfunction

virtual task check(int n);

Transaction trn_h = new();
foreach(scb_h.sent_trn[iJ) begin
@(posedge v_io.clk);
#1 v_io.read_pointer = i;
#8 print_results();
trn_h.operand_a = v_io.instruction_word.op_a;
trn_h.operand_b = v_io.instruction_word.op_b;
trn_h.opcode = v_io.instruction_word.opc;
trn_h.write_pointer = v_io.read_pointer;
if (!scb_h.sent_trn[i].compare(trn_h)) begin
gerror(" Expected Transaction %p \n Actual Transaction %p", scb.h.sent_trn[i], trn_h);
end
end

endtask

virtual function void print_results();

$display("Read from register location %2d: opcode = %@d (%5s) operand_a =%3d operand_b =%3d",
v_io.read_pointer, v_io.instruction_word.opc, v_io.instruction_word.opc.name(), v_io.instruction_word.op_a, v_io.instruction_word.op_b);

endfunction

endclass : Monitor