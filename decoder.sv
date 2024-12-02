/////////////////////////////////////////////////////////////////////
// Design unit: decoder
//            :
// File name  : decoder.sv
//            :
// Description: Decoder for basic processor
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
// Revision   : Version 1.0 08/03/24 Completely rewritten
/////////////////////////////////////////////////////////////////////

module decoder #(parameter OP_W = 3)
                  (input logic clock, n_reset, z_flag,
                   input logic [OP_W-1:0] op,
                   output logic load_REG, load_PC, load_IR,  ALU_REG, 
                                ALU_add, ALU_sub, ALU_xor, INC_PC, WE, IMM);

`include "opcodes.svh"

enum logic {fetch, execute} Present_State, Next_State;

always_ff @(posedge clock, negedge n_reset)
  begin: seq
    if (!n_reset)
      Present_State <= fetch;
    else
      Present_State <= Next_State;
    end


always_comb
  begin: com
  // reset all the control signals to default 0
  load_REG = 1'b0;
  load_IR = 1'b0;
  ALU_REG = 1'b0;
  ALU_add = 1'b0;
  ALU_sub = 1'b0;
  ALU_xor = 1'b0;
  INC_PC = 1'b0;
  load_PC = 1'b0;
  WE = 1'b0;
  IMM = 1'b0;
  
  unique case (Present_State)
    fetch:   begin
             load_IR = 1'b1;
             Next_State = execute;
             end
    execute: begin
             load_PC = 1'b1;
             INC_PC = 1'b1;
             unique case (op)
             `STORE: begin
                     WE = 1'b1;
                     end
             `LOAD:  begin
                     load_REG = 1'b1;
                     end
             `BNE:   begin
                     if (z_flag == 1'b0)
                       INC_PC = 1'b0;
                     end    
             `ADD:   begin
                     load_REG = 1'b1;
                     ALU_REG = 1'b1;
                     ALU_add = 1'b1;
                     end    
             `SUB:   begin
                     load_REG = 1'b1;
                     ALU_REG = 1'b1;
                     ALU_sub = 1'b1;
                     end 
             `ADDI:  begin
                     IMM = 1'b1;
                     load_REG = 1'b1;
                     ALU_REG = 1'b1;
                     ALU_add = 1'b1;
                     end
             `XOR:   begin
                     load_REG = 1'b1;
                     ALU_REG = 1'b1;
                     ALU_xor = 1'b1;
                     end    
             default:; 
             endcase
             Next_State = fetch;
             end

  endcase
  end
  
endmodule
