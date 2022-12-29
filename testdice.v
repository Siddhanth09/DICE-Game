module tester ();
 wire rb1; 
 wire reset1; 
 reg clk1; 
 wire roll1; 
 wire win1; 
 wire lose1; 
 wire[3:0] sum1; 
 initial
 begin
 clk1 = 0;
 end
 always #20 clk1 <= ~clk1;
 DiceGame Dice (rb1, reset1, clk1, sum1, roll1, win1, lose1); 
 GameTest Dicetest (rb1, reset1, sum1, clk1, roll1, win1, lose1); 
endmodule
