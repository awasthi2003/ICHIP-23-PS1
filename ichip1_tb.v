`timescale 1ns/1ps
`include "ichip1.v"
module test;
    reg [7:0]x,y;
    reg zx,nx,zy,ny,f,no;
    reg clk;
    wire [7:0] o[17:0];
    wire zr[17:0],ng[17:0];
    integer i,file;
CalC a0(x,y,1,0,1,0,0,0,o[0],zr[0],ng[0]);  // for 0 
CalC a1(x,y,1,1,1,1,1,1,o[1],zr[1],ng[1]);  // for 1 
CalC a2(x,y,1,1,1,0,1,0,o[2],zr[2],ng[2]);  // for -1 
CalC a3(x,y,0,0,1,0,1,0,o[3],zr[3],ng[3]);  // for x 
CalC a4(x,y,1,0,0,0,1,0,o[4],zr[4],ng[4]);  // for y 
CalC a5(x,y,0,1,1,0,1,0,o[5],zr[5],ng[5]) ; // for !x 
CalC a6(x,y,1,0,0,1,1,0,o[6],zr[6],ng[6]);  // for !y 
CalC a7(x,y,0,0,1,1,1,1,o[7],zr[7],ng[7]);  // for -x 
CalC a8(x,y,1,1,0,0,1,1,o[8],zr[8],ng[8]);  // for -y 
CalC a9(x,y,0,1,1,1,1,1,o[9],zr[9],ng[9]);  // for x+1 
CalC a10(x,y,1,1,0,1,1,1,o[10],zr[10],ng[10]);  // for y+1 
CalC a11(x,y,0,0,1,1,1,0,o[11],zr[11],ng[11]);  // for x-1 
CalC a12(x,y,1,1,0,0,1,0,o[12],zr[12],ng[12]);  // for y-1 
CalC a13(x,y,0,0,0,0,1,0,o[13],zr[13],ng[13]);  // for x+y 
CalC a14(x,y,0,1,0,0,1,1,o[14],zr[14],ng[14]);  // for x-y 
CalC a15(x,y,0,0,0,1,1,1,o[15],zr[15],ng[15]);  // for y-x 
CalC a16(x,y,0,0,0,0,0,0,o[16],zr[16],ng[16]);  // for x&y 
CalC a17(x,y,0,1,0,1,0,1,o[17],zr[17],ng[17]);  // for x|y 
initial begin
    file = $fopen("output.txt");
    clk=0;
    $dumpfile("ichip1.vcd");
    $dumpvars(0,test);
     
    x = 8'b11111111; y= 8'b11001111;

   #10 x = 8'b01110110; y= 8'b00101010;
   #10 x = 8'b11100111; y= 8'b11010101;
   #10 x = 8'b11000111; y= 8'b11001010;
   #10 x = 8'b00011100; y= 8'b11110101;
   #10 x = 8'b11011011; y= 8'b00101011;
   #10 x = 8'b11110111; y= 8'b11011100;
   #10 x = 8'b01010101; y= 8'b10011011;
   #10 x = 8'b10101010; y= 8'b11011010;
   #10 x = 8'b11001101; y= 8'b11111111;
   #10 $finish;
end
always
 #5 clk <= ~clk;
always @(posedge clk)
begin
     for(i=0;i<=17;i=i+1)
     begin
        $fdisplay(file,$time,"  x = %b, y =%b , o = %b, zr = %b, ng = %b",x,y,o[i],zr[i],ng[i]);
     end
     $fdisplay(file);
  
end
   
endmodule
// iverilog -o ichip1_tb.vvp ichip1_tb.v
// vvp ichip1_tb.vvp