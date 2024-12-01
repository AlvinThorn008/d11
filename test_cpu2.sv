/////////////////////////////////////////////////////////////////////
// Design unit: test_cpu2
//            :
// File name  : test_cpu2.sv
//            :
// Description: Simple testbench for basic processor
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
//            : Version 1.2 19/12/17
//            : Version 1.3 08/01/21 - For remote working
//            : Version 1.4 19/01/23 Includes disp0, disp1, excludes sysbus
//            : Version 1.5 26/11/24 Consistent naming
/////////////////////////////////////////////////////////////////////

module test_cpu2;

parameter int WORD_W = 8, OP_W = 3;

logic  clock, n_reset;
logic [6:0] disp0, disp1;
logic [WORD_W-1:0] switches;

cpu2 #(.WORD_W(WORD_W), .OP_W(OP_W)) c1 (.*);

always
  begin
#10ns clock = 1'b1;
#10ns clock = 1'b0;
end

initial
begin
n_reset = 1'b1;
#1ns n_reset = 1'b0;
#2ns n_reset = 1'b1;
end

initial 
begin 
switches = 3;
end



endmodule
