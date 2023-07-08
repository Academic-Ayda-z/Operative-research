var float : x1;
var float : x2;
var float : s1;
var float : s2;
var float : s3;
var float : r1;
var float : M=1000;



constraint 3*x1+2*x2+s1=20;
constraint 2*x1+3*x2+s2=20;
constraint x1+2*x2-s3+r1=2;
constraint x1>=0;
constraint x2>=0;

solve maximize x1+x2-M*r1;