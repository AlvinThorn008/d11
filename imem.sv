/////////////////////////////////////////////////////////////////////
// Design unit: imem
//            :
// File name  : imem.sv
//            :
// Description: Instruction memory for basic processor
//            : including simple program
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
// Revision   : Version 1.0 12/12/14
//            : Version 1.1 14/01/21 Simplified some of the syntax
//            : Version 2.0 14/03/24 Rewritten to remove tristate bus
//            :   and address register
/////////////////////////////////////////////////////////////////////

module imem #(parameter WORD_W = 8, OP_W = 3)
               (input logic [WORD_W-OP_W-1:0] Iaddress,
                output logic [WORD_W-1:0] Idata);

`include "opcodes.svh"


always_comb
  begin
  Idata = 0;
  case (Iaddress)
    0: Idata = {`STORE, 5'd30}; //Store the contents of data register
    1: Idata = {`LOAD, 5'd30};  //Load the contents of address into the data register
    2: Idata = {`ADD, 5'd31};    //Add the value of the operand to the data register
    3: Idata = {`STORE, 5'd30}; //Store the contents of data register
    4: Idata = {`BNE, 5'd1};    //Branch if result of last arithmetic operation is not zero
    default: Idata = 0;         //rest of ROM is 0
  endcase
  end

endmodule
