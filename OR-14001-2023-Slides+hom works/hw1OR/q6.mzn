var int : xA;
var int : xB;
var int : xC;
var int : xD;

var int : w1;
var int : w2;
var int : t;

constraint 0.1*xA+0.25*xB+0.08*xC+0.21*xD <= 72;
constraint 36*xA+48*xB+25*xC+35*xD <= 25000;
constraint w1+t >= xA+xB;
constraint w2+t >= xC+xD;
constraint w1 <= 500;
constraint w2 <= 500;
constraint t <= 1200;
constraint t>=3*xA+3*xB+xC+xD;
constraint xA>=0;
constraint xB>=0;
constraint xC>=0;
constraint xD>=0;
constraint t>=0;
constraint w1>=0;
constraint w2>=0;

solve maximize xA*90+125*xB+45*xC+65*xD;

output["result:",show((xA)*90+125*(xB)+45*(xC)+65*(xD))];