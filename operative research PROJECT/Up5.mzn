int: k=2;
int: n=3;
array[1..k,1..2] of var int :c;
array[1..n,1..k] of var 0..1:y;

array[1..n,1..2] of int :N =[|-7, -9,
                            |-6, -9,
                            |2, 3,
  
                            |];

constraint forall(j in 1..k)(sum(i in 1..n)(y[i,j])>=1);
constraint forall(j in 1..k)(sum(i in 1..n)(y[i,j])<=n);

constraint forall(i in 1..n)(sum(j in 1..k)(y[i,j])=1);
constraint forall(i in 1..n)(forall(j,p in 1..k where p!=j)((abs(N[i,1]-c[j,1])+abs(N[i,2]-c[j,2]))*y[i,j] <= (abs(N[i,1]-c[p,1])+abs(N[i,2]-c[p,2])) )); 


constraint forall(i,ii,iii in 1..n where i!=ii /\ i!=iii)(forall(j in 1..k)((abs(N[i,1]-c[j,1])+abs(N[i,2]-c[j,2]))*y[i,j] <= max(abs(N[i,2]-N[iii,2])+abs(N[i,1]-N[iii,1]),abs(N[i,2]-N[ii,2])+abs(N[i,1]-N[ii,1]))));



solve maximize sum(j in 1..k)(sum(p in 1..k where p!=k)(abs(c[j,2]-c[p,2])+abs(c[j,1]-c[p,1])));
/*  output["result:",show(sum(j in 1..k)(sum(p in 1..k)(abs(c[j,2]-c[p,2])+abs(c[j,1]-c[p,1]))))];*/