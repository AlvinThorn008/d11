/////////////////////////////////////////////////////////////////////
// Design unit: sevenseg
//            :
// File name  : sevenseg.sv
//            :
// Description: Seven segment decoder described as ROM
//            : Active Low outputs
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
// Revision   : Version 1.2 19/12/17
//            : Version 1.3 26/11/24 Display in simulation
/////////////////////////////////////////////////////////////////////

module sevenseg(output logic [6:0] seg, 
                input logic [3:0] digit);

always_comb
  unique case (digit)
    4'b0000 : seg = 7'b1000000;
    4'b0001 : seg = 7'b1111001;
    4'b0010 : seg = 7'b0100100;
    4'b0011 : seg = 7'b0110000;
    4'b0100 : seg = 7'b0011001;
    4'b0101 : seg = 7'b0010010;
    4'b0110 : seg = 7'b0000010;
    4'b0111 : seg = 7'b1111000;
    4'b1000 : seg = 7'b0000000;
    4'b1001 : seg = 7'b0010000;
    4'b1010 : seg = 7'b0001000;
    4'b1011 : seg = 7'b0000011;
    4'b1100 : seg = 7'b1000110;
    4'b1101 : seg = 7'b0100001;
    4'b1110 : seg = 7'b0000110;
    4'b1111 : seg = 7'b0001110;
    default : seg = 7'b1111111;
  endcase
  
  
  
//This always_comb block emulates the behaviour of a 7-segment display for simulation.
//The compiler directive is not necessary, but it makes it clear that this block is
//not synthesised.
  
`ifndef SYNTHESIS
  
always_comb
  begin
  $display("The digit displayed by %m at %t is:",$time);
    if (seg[0])
      $display("");
    else
      $display(" _");
    if (seg[5])
      $write(" ");
    else 
      $write("|");
    if (seg[6])
      $write(" ");
    else 
      $write("_");
    if (seg[1])
      $display(" ");
    else 
      $display("|");
    if (seg[4])
      $write(" ");
    else 
      $write("|");
    if (seg[3])
      $write(" ");
    else 
      $write("_");
    if (seg[2])
      $display(" ");
    else 
      $display("|");  

  end
  
`endif    
  
  
endmodule

