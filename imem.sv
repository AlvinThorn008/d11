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
    1: Idata = {`LOADI, 5'd1};  // --| store 1 at #11
    2: Idata = {`STORE, 5'd11}; // --|
    3: Idata = {`LOADI, 5'd8}; // Load counter = 7 to data register
    4: Idata = {`STORE, 5'd9}; // Store the counter in #9
    5: Idata = {`LOADR, 5'b0}; // Load value at addr counter
    6: Idata = {`XOR, 5'd31}; // XOR str[counter] with key into data register
    7: Idata = {`STORE, 5'd30}; // Store plaintext at addr 30: displays to sevenseg
    8: Idata = {`LOAD, 5'd9};
    9: Idata = {`SUB, 5'd11};
    10: Idata = {`BNE, 5'd4}; // loop back to inst 4 if counter != 0
    default: Idata = 0;         //rest of ROM is 0
  endcase
  end

endmodule
