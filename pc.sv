/////////////////////////////////////////////////////////////////////
// Design unit: pc
//            :
// File name  : pc.sv
//            :
// Description: Program counter for basic processor
//            :
// Limitations: None
//            :
// System     : SystemVerilog IEEE 1800-2005
//            :
// Author     : Mark Zwolinski
//            : School of Electronics and Computer Science
//            : University of Southampton
//            : Southampton SO17 1BJ, UK
//            : mz@ecs.soton.ac.uk
//
// Revision   : Version 1.0 05/08/08
//            : Version 1.1 17/12/13
//            : Version 1.2 14/01/21 Simplified some of the syntax
//            : Version 2.0 14/03/24 Rewritten to remove tristate bus
/////////////////////////////////////////////////////////////////////

module pc #(parameter WORD_W = 8, OP_W = 3)
               (input logic clock, n_reset, INC_PC, load_PC,
                input logic [WORD_W-OP_W-1:0] branchaddr,
                output logic [WORD_W-OP_W-1:0] Iaddress);

always_ff @(posedge clock, negedge n_reset)
  begin
  if (!n_reset)
    Iaddress <= 0;
  else
    if (load_PC)
      if (INC_PC)
        Iaddress <= Iaddress + 1;
      else
        Iaddress <= branchaddr;
  end
endmodule
