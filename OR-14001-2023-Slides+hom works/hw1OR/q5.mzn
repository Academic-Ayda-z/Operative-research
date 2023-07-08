array [1..4,1..5] of var int:s;
array [1..2,1..5] of var int:p;

array [1..4,1..5] of int:sd=[|6,0,6,0,6,
                                   |0,6,0,6,0,
                                   |4,8,4,0,4,
                                   |5,5,5,0,5
                                   |];
                                  
array [1..2,1..5] of int:pd=[|3,0,3,8,0,
                                |0,0,0,6,2
                                |];
array [1..6] of float:wage=[10.00,10.10,9.90,9.80,10.80,11.30];

constraint forall(k in 1..2)(sum(j in 1..5)(p[k,j]) >= 7);
constraint forall(i in 1..4)(sum(j in 1..5)(s[i,j]) >= 8);

constraint forall(j in 1..5)(forall(i in 1..4)(s[i,j] <= sd[i,j]));
constraint forall(j in 1..5)(forall(i in 1..2)(p[i,j] <= pd[i,j]));

constraint forall(i in 1..4)(forall(j in 1..5)(s[i,j] >=0));
constraint forall(i in 1..2)(forall(j in 1..5)(p[i,j] >=0));

constraint forall(j in 1..5)(sum(k in 1..2)(p[k,j])+sum(i in 1..4)(s[i,j]) = 14);

solve minimize sum(i in 1..4)(wage[i]  * sum(j in 1..5)(s[i,j]))+ 
               sum(k in 1..2)(wage[k+4]* sum(j in 1..5)(p[k,j]));