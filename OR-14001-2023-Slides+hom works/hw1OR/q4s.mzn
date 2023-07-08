array[1..7] of var 0.0..1.0: x;
array[1..7] of int :term =  [4,7,8,6,10,5,0];
array[1..7] of int :return = [3,12,9,20,15,6,0];
array[1..7] of int :risk = [1,5,4,8,6,3,0];
array[1..7] of int :growth = [0,18,10,32,20,7,0];

constraint sum(i in 1..7)(x[i]*term[i]) <= 7;
constraint sum(i in 1..7)(x[i]*risk[i]) <= 5 ;
constraint sum(i in 1..7)(x[i]*growth[i]) >= 10;
constraint x[7] >= 0.1;
constraint sum(i in 1..7)(x[i]) = 1;
var float :result=sum(i in 1..7)(x[i]*return[i]);
solve  maximize result;