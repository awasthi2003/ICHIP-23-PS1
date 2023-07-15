module CalC(x,y,zx,nx,zy,ny,f,no,o,zr,ng);
input [7:0] x,y;
input zx,nx,zy,ny,f,no;
output [7:0] o;
output zr,ng;
wire [7:0] x1,y1,x2,y2,z1;

assign x1 = zx ? 8'b00000000 : x;
assign x2 = nx ? ~x1 : x1;
assign y1 = zy ? 8'b00000000 : y;
assign y2 = ny ? ~y1 : y1;
assign z1 = f ? (x2+y2): (x2&y2);
assign  o = no ? ~z1 : z1;
assign zr = ~(|o);
assign ng = o[7];

// always @(x,zx,nx) begin
//     if(zx==1)
//     x1 = 8'b00000000;
//     else x1 = x;
//     if(nx==1)
//     x2 = ~x1;
//     else x2 = x1;
// end

// always @(y,zy,ny) begin
//     if(zy==1)
//     y1 = 8'b00000000;
//     else y1 = x;
//     if(ny==1)
//     y2 = ~x1;
//     else y2 = y1;
// end

// always @(x,y,f,o) begin
    
// end


endmodule