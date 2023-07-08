int: k=2;
int: n=4;
array[1..k,1..2] of var int :c;
array[1..n,1..k] of var bool:y;

array[1..n,1..2] of var int :N =[|-7, 6,
                            |-2, -9,
                            |2, 3,
                            |-7, 6,
                            |];

array[1..n,1..k] of  var int: a;
array[1..n,1..k] of  var int: b;


constraint forall(j in 1..k)(sum(i in 1..n)(y[i,j])>=0);
constraint forall(j in 1..k)(sum(i in 1..n)(y[i,j])<=n);

constraint forall(i in 1..n)(sum(j in 1..k)(y[i,j])=1);


constraint forall(i in 1..n)(forall(j in 1..k )(abs(N[i,1]-c[j,1])=a[i,j]));

constraint forall(i in 1..n)(forall(j in 1..k )(abs(N[i,2]-c[j,2])=b[i,j]));


solve minimize sum(i in 1..n)(sum(j in 1..k)((a[i,j]+b[i,j])*y[i,j]));

