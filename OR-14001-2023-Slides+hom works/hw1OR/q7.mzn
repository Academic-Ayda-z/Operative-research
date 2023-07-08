array[1..7] of var float: f;
array[1..7] of int: carb=[800,680,0,45,18,35,25];
array[1..7] of int: prot=[1500,40,1400,5,4,5,25];
array[1..7] of int: fat=[200,10,400,0,0,40,150];
array[1..7] of int: maxAvail=[80,10,20,30,30,30,100];
array[1..7] of int: w=[160,80,400,40,20,40,10];

constraint sum(i in 1..7)(f[i]*carb[i]) >= 0.35*sum(i in 1..7)(f[i]*(carb[i]+prot[i]+fat[i]));
constraint sum(i in 1..7)(f[i]*prot[i]) >= 0.25*sum(i in 1..7)(f[i]*(carb[i]+prot[i]+fat[i]));
constraint sum(i in 1..7)(f[i]*fat[i])  >= 0.15*sum(i in 1..7)(f[i]*(carb[i]+prot[i]+fat[i]));
constraint sum(i in 1..7)(f[i]*fat[i])  <= 0.25*sum(i in 1..7)(f[i]*(carb[i]+prot[i]+fat[i]));
constraint f[4]+f[6] <= 45;
constraint sum(i in 1..7)(f[i]*fat[i])  >= 0.15*sum(i in 1..7)(f[i]*(carb[i]+prot[i]+fat[i]));
constraint sum(i in 1..7)(f[i]*(carb[i]+prot[i]+fat[i]) ) >= 2*1800*60;
constraint forall(i in 1..7)(f[i] >= 0.0);

solve minimize sum(i in 1..7)(f[i]*w[i]);