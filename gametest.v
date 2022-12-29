module GameTest (Rb, Reset, Sum, CLK, Roll, Win, Lose);
 output Rb; 
 output Reset; 
 output[3:0] Sum; 
 input CLK; 
 input Roll; 
 input Win; 
 input Lose; 
 reg[3:0] Sum;
 reg Reset;
 reg Rb;
 reg[1:0] Tstate; 
 reg[1:0] Tnext; 
 reg Trig1; 
 integer Sumarray[0:11]; 
 integer i; 
 initial
 begin
 Sumarray[0] = 7;
 Sumarray[1] = 11;
Sumarray[2] = 2;
 Sumarray[3] = 4;
 Sumarray[4] = 7;
 Sumarray[5] = 5;
 Sumarray[6] = 6;
 Sumarray[7] = 7;
 Sumarray[8] = 6;
 Sumarray[9] = 8;
 Sumarray[10] = 9;
 Sumarray[11] = 6;
 i = 0;
 Tstate = 0;
 Tnext = 0;
 Trig1 = 0;
 end
 always @(Roll or Win or Lose or Tstate)
 begin
 case (Tstate)
 0 :
 begin
 Rb = 1'b1; 
 Reset = 1'b0; 
 if (i >= 12) begin
 Tnext = 3; 
 end
else if (Roll == 1'b1) begin
 Sum = Sumarray[i]; 
 i = i + 1; 
 Tnext = 1; 
 end
 end
 1 :
 begin
 Rb = 1'b0; 
 Tnext = 2; 
 end
 2 :
 begin
 Tnext = 0; 
 Trig1 = ~Trig1; 
 if ((Win || Lose) == 1'b1) begin
 Reset = 1'b1; 
 end
 end
 3 :
 begin
end
 endcase
 end
 always @(posedge CLK)
begin
 Tstate <= Tnext; 
 end
endmodule
