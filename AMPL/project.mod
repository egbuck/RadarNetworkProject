param Nr_Nodes >= 1, integer;
param NPairs >= 1, integer;
param DC >= 0;

param Dist_Matrix {i in 1..Nr_Nodes, j in 1..Nr_Nodes} >= 0;
param F_Matrix {k in 1..NPairs, j in 1..Nr_Nodes} binary;

var X {j in 1..Nr_Nodes} binary;

param a{i in 1..Nr_Nodes, j in 1..Nr_Nodes} = 
      if Dist_Matrix[i, j] <= DC
           then 1
           else 0;
           
           
minimize object: sum{j in 1..Nr_Nodes} X[j];

s.t.  contraintOne {i in 1..Nr_Nodes}: sum {j in 1..Nr_Nodes} a[i, j] * X[j] >= 1;
s.t.  constraintTwo {k in 1..NPairs}: sum {j in 1..Nr_Nodes} F_Matrix[k, j] * X[j] >= 1;