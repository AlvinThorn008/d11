/////////////////////////////////////////////////////////////////////
// Design unit: buffer
//            :
// File name  : buffer.sv
//            :
// Description: Registered input buffer for switches
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
// Revision   : Version 1.0 14/01/21 
//            : Version 1.1 26/11/24 Changed names
/////////////////////////////////////////////////////////////////////

module buffer #(parameter WORD_W = 8, OP_W = 3)
               (output logic [WORD_W-1:0] Sdata, 
                input logic [WORD_W-1:0] switches,
                input logic clock);

always_ff @(posedge clock)
  Sdata <= switches;

endmodule
