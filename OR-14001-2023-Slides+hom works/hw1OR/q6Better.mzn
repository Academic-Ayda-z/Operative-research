var int : xA;
var int : xB;
var int : xC;
var int : xD;

var int : xAt;
var int : xBt;
var int : xCt;
var int : xDt;

var int : w1;
var int : w2;
var int : t;

constraint 0.1*(xA+xAt)+0.25*(xB+xBt)+0.08*(xC+xCt)+0.21*(xD+xDt) <= 72;
constraint 36*(xA+xAt)+48*(xB+xBt)+25*(xC+xCt)+35*(xD+xDt) <= 25000;
constraint w1 >= xA+xB;
constraint w2 >= xC+xD;
constraint w1 <= 500;
constraint w2 <= 500;
constraint t  <= 1200;
constraint t  >= 3*xAt+3*xBt+xCt+xDt;

constraint xA>=0;
constraint xB>=0;
constraint xC>=0;
constraint xD>=0;

constraint xAt>=0;
constraint xBt>=0;
constraint xCt>=0;
constraint xDt>=0;

constraint t>=0;
constraint w1>=0;
constraint w2>=0;

solve maximize (xA+xAt)*90+125*(xB+xBt)+45*(xC+xCt)+65*(xD+xDt);
output["result: ",show((xA+xAt)*90+125*(xB+xBt)+45*(xC+xCt)+65*(xD+xDt))];
/*
xA = 313;
xB = 0;
xC = 0;
xD = 0;
xAt = 0;
xBt = 286;
xCt = 0;
xDt = 0;
w1 = 500;
w2 = 500;
t = 1200;
*/