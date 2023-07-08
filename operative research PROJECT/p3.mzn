int: k=2;
int: n=4;
array[1..k,1..2] of var int :c;
array[1..n,1..k] of var 0..1:y;

array[1..n,1..2] of int :N =[|-7, -9,
                            |-6, -9,
                            |92, 93,
                            |99,93
  
                            |];

array[1..n,1..k] of var int: a;
array[1..n,1..k] of var int: b;
array[1..n,1..k] of var int: e;
array[1..n,1..k] of var int: d;

array[1..k,1..k] of var int: f;
array[1..k,1..k] of var int: g;

constraint forall(j in 1..k)(sum(i in 1..n)(y[i,j])>=1);
constraint forall(j in 1..k)(sum(i in 1..n)(y[i,j])<=n);

constraint forall(i in 1..n)(sum(j in 1..k)(y[i,j])=1);

constraint forall(i in 1..n)(forall(j in 1..k )(a[i,j]>=0));
constraint forall(i in 1..n)(forall(j in 1..k )(b[i,j]>=0));
constraint forall(i in 1..n)(forall(j in 1..k )(e[i,j]>=0));
constraint forall(i in 1..n)(forall(j in 1..k )(e[i,j]>=0));
constraint forall(i in 1..k)(forall(j in 1..k )(f[i,j]>=0));
constraint forall(i in 1..k)(forall(j in 1..k )(g[i,j]>=0));



constraint forall(i in 1..n)(forall(j in 1..k )(N[i,1]-c[j,1]<=a[i,j]));
constraint forall(i in 1..n)(forall(j in 1..k )(N[i,1]-c[j,1]>=-1*a[i,j])); 

constraint forall(i in 1..n)(forall(j in 1..k )(N[i,2]-c[j,2]<=b[i,j]));
constraint forall(i in 1..n)(forall(j in 1..k )(N[i,2]-c[j,2]>=-1*b[i,j]));


constraint forall(i in 1..n)(forall(p in 1..k )(N[i,1]-c[p,1]<=d[i,p]));
constraint forall(i in 1..n)(forall(p in 1..k )(N[i,1]-c[p,1]>=-1*d[i,p])); 

constraint forall(i in 1..n)(forall(p in 1..k )(N[i,2]-c[p,2]<=e[i,p]));
constraint forall(i in 1..n)(forall(p in 1..k )(N[i,2]-c[p,2]>=-1*e[i,p]));

constraint forall(i in 1..n)( forall(j,p in 1..k where p!=j)(  ((a[i,j]+b[i,j])*y[i,j]) <= ((d[i,p]+e[i,p])*y[i,j])) );

constraint forall(j in 1..k)(forall(p in 1..k where p!=j)((c[j,2]-c[p,2])<=f[j,p]));
constraint forall(j in 1..k)(forall(p in 1..k where p!=j)((c[j,2]-c[p,2])>=-1*f[j,p]));

constraint forall(j in 1..k)(forall(p in 1..k where p!=j )((c[j,1]-c[p,1])>=-1*g[j,p]));
constraint forall(j in 1..k)(forall(p in 1..k where p!=j)((c[j,1]-c[p,1])<=g[j,p]));

constraint forall(i in 1..n)(forall(j in 1..k )((a[i,j]+b[i,j])*y[i,j]<=100));

solve maximize sum(j in 1..k)(sum(p in 1..k)(f[j,p]+g[j,p]));
output["result:",show(sum(j in 1..k)(sum(p in 1..k)(f[j,p]+g[j,p])))];