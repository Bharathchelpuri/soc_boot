
//////////////////////////////////////////the
`celldefine
module PDB3A (AIO);
   inout AIO;
   tran (AIO,AIO);
endmodule
`endcelldefine

//////////////////////////////////////////

`celldefine
module PVDD2CDG (VDDPST);
    inout   VDDPST;
    tran (VDDPST,VDDPST);
endmodule
`endcelldefine

///////////////////////////////////////////

`celldefine
module PVSS2CDG (VSSPST);
    inout   VSSPST;
    tran (VSSPST,VSSPST);
endmodule
`endcelldefine

/////////////////////////////////////////

`celldefine
module PXOE1CDG (XC, XO, XI, XE);
    input XI, XE;
    output XC, XO;
    not                  (XC, XO);
    nand                 (XO, XE, XI);
    specify
       (XE => XC)=(0, 0);
       (XE => XO)=(0, 0);
       (XI => XC)=(0, 0);
       (XI => XO)=(0, 0);
    endspecify
endmodule
`endcelldefine

/////////////////////////////////////////////

`celldefine
module PRDW0408CDG (I,DS,OEN,PAD,C,PE,IE);
   input I,DS,OEN,PE,IE;
   inout PAD;
   output C;
   wire  MG;
   parameter PullTime = 100000;
   reg lastPAD, pull_uen, pull_den,PS;
initial begin
  pull_uen = 0;
  pull_den = 0;
  PS = 0;
end
  bufif1 (weak0, weak1)(PAD_i, 1'b1, pull_uen);
  bufif1 (weak0, weak1)(PAD_i, 1'b0, pull_den); 
  buf    (C, CO);
  and    (CO, C_buf, IE);
  nand   (PUEN, PS, PE);
  not    (PU, PUEN);
  not    (PSB, PS);
  and    (PD, PE, PSB);
  bufif0 (PAD_q, I, OEN);
  pmos   (DS_tmp, DS, 1'b0);
  pmos   (C_buf, PAD, 1'b0);
  pmos   (MG, PAD_q, 1'b0);
  pmos   (MG, PAD_i, 1'b0);
  pmos   (PAD, MG, 1'b0);
  always @(PAD) lastPAD=PAD;
  always @(PAD or PU or PD) begin
    if (PAD === 1'bx && !$test$plusargs("bus_conflict_off") && $countdrivers(PAD))
       $display("ERROR : %t ++BUS CONFLICT++ : %m", $realtime);
    if (PAD === 1'bz || (PAD === 1'b1) || (PAD === 1'b0)) begin
         if (PU) begin
            if (lastPAD === 1'b1) 
            begin
              pull_uen=1; pull_den=0;
            end
            else begin
              pull_uen <= #PullTime 1;
              pull_den <= #PullTime 0;
            end
         end           
         else pull_uen=0;
         if (PD) begin
            if (lastPAD === 1'b0) 
            begin
              pull_den=1; pull_uen=0;
            end
            else begin
              pull_den <= #PullTime 1;
              pull_uen <= #PullTime 0;
            end
         end
         else pull_den=0;
    end 
  end
   specify
     if (DS == 1'b0) (I => PAD)=(0, 0);
     if (DS == 1'b1) (I => PAD)=(0, 0);
     if (DS == 1'b0) (OEN => PAD)=(0, 0, 0, 0, 0, 0);
     if (DS == 1'b1) (OEN => PAD)=(0, 0, 0, 0, 0, 0);
     (PAD => C)=(0, 0);
     (IE => C)=(0, 0);
   endspecify

endmodule
`endcelldefine

////////////////////////////////////////////////////////////////

`celldefine
module PRUW0408CDG (I,DS,OEN,PAD,C,PE,IE);
   input I,DS,OEN,PE,IE;
   inout PAD;
   output C;
   wire  MG;
   parameter PullTime = 100000;
   reg lastPAD, pull_uen, pull_den,PS;
initial begin
  pull_uen = 0;
  pull_den = 0;
  PS = 1;
end
  bufif1 (weak0, weak1)(PAD_i, 1'b1, pull_uen);
  bufif1 (weak0, weak1)(PAD_i, 1'b0, pull_den); 
  buf    (C, CO);
  and    (CO, C_buf, IE);
  nand   (PUEN, PS, PE);
  not    (PU, PUEN);
  not    (PSB, PS);
  and    (PD, PE, PSB);
  bufif0 (PAD_q, I, OEN);
  pmos   (DS_tmp, DS, 1'b0);
  pmos   (C_buf, PAD, 1'b0);
  pmos   (MG, PAD_q, 1'b0);
  pmos   (MG, PAD_i, 1'b0);
  pmos   (PAD, MG, 1'b0);
  always @(PAD) lastPAD=PAD;
  always @(PAD or PU or PD) begin
    if (PAD === 1'bx && !$test$plusargs("bus_conflict_off") && $countdrivers(PAD))
       $display("ERROR : %t ++BUS CONFLICT++ : %m", $realtime);
    if (PAD === 1'bz || (PAD === 1'b1) || (PAD === 1'b0)) begin
         if (PU) begin
            if (lastPAD === 1'b1) 
            begin
              pull_uen=1; pull_den=0;
            end
            else begin
              pull_uen <= #PullTime 1;
              pull_den <= #PullTime 0;
            end
         end           
         else pull_uen=0;
         if (PD) begin
            if (lastPAD === 1'b0) 
            begin
              pull_den=1; pull_uen=0;
            end
            else begin
              pull_den <= #PullTime 1;
              pull_uen <= #PullTime 0;
            end
         end
         else pull_den=0;
    end 
  end
   specify
     if (DS == 1'b0) (I => PAD)=(0, 0);
     if (DS == 1'b1) (I => PAD)=(0, 0);
     if (DS == 1'b0) (OEN => PAD)=(0, 0, 0, 0, 0, 0);
     if (DS == 1'b1) (OEN => PAD)=(0, 0, 0, 0, 0, 0);
     (PAD => C)=(0, 0);
     (IE => C)=(0, 0);
   endspecify

endmodule
`endcelldefine

///////////////////////////////////////////////////////////////

