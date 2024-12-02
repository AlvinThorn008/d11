/////////////////////////////////////////////////////////////////////
// Design unit: alu
//            :
// File name  : alu.sv
//            :
// Description: ALU for basic processor
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

module alu #(parameter WORD_W = 8)
            (input logic clock, n_reset, load_REG, ALU_REG, ALU_add, ALU_sub, ALU_xor,
             input logic [WORD_W-1:0] Adata,
             output logic [WORD_W-1:0] Wdata,
             output logic z_flag);

always_comb
  if (Wdata == 0)
    z_flag = 1'b1;
  else
    z_flag = 1'b0;

always_ff @(posedge clock, negedge n_reset)
  begin
  if (!n_reset)
    Wdata <= 0;
  else
    if (load_REG)
      if (ALU_REG)
        begin
        if (ALU_add)
          Wdata <= Wdata + Adata;
        else if (ALU_sub)
          Wdata <= Wdata - Adata;
        else if (ALU_xor)
          Wdata <= Wdata ^ Adata;
        end
      else
        Wdata <= Adata;
  end
endmodule
