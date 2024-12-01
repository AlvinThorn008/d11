/////////////////////////////////////////////////////////////////////
// Design unit: resgister
//            :
// File name  : register.sv
//            :
// Description: Output register for basic processor
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
// Revision   : Version 1.0 26/11/24
/////////////////////////////////////////////////////////////////////

module register #(parameter WORD_W = 8, OP_W = 3)
                (output logic [WORD_W-1:0] digits,
                input logic [WORD_W-1:0] Wdata,
                input logic WE, clock);

always_ff @(posedge clock)
  begin
  if (WE) 
    digits <= Wdata;
  end

endmodule
