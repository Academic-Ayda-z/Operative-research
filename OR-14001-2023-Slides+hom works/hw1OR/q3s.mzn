
var float: x1;
var float: x2;
constraint (4*x1+5*x2)<=36;
constraint (23*x1+13*x2)<=15*(x1+x2+1);
constraint x1>=0;
constraint x2>=0;
solve maximize -1*(4*x1+11*x2+20)+10*(1+x1+x2);
output ["max :",show(-1*(4*x1+11*x2+20)+10*(1+x1+x2)),"  x1: ",show(x1),"  x2: ",show(x2)]