%%Rojan Bhattarai
%%Optimization Course Project


clear all;
close all;
clc;

f = zeros(1,46);  %in order of x1, x2, x3


%objective function, first variable
f  = [80 60 120 80 160 240 320 160 100 64 60 30 80 320 50 240 80 240 160 160 80 80 160 80 240 320 80 240 40 240 80 240 180 90 80 50 130 160 80 90 150 18000 8000 12000 24000 10000 ];



%Aineq coefficient matrix and bineq vector

%first constraint (Atlanta Monthly Production Capacity) 
Aineq(1,1) = 1;
Aineq(1,2) = 1;
Aineq(1,3) = 1;
Aineq(1,4) = 1;
Aineq(1,5) = 1;
Aineq(1,6) = 1;
Aineq(1,7) = 1;
Aineq(1,8) = 1;
Aineq(1,9) = 1;
Aineq(1,10) = 1;
bineq(1,1) = 150000;

%second constraint (Charlotte Monthly Production Capacity)
Aineq(2,11) = 1;
Aineq(2,12) = 1;
Aineq(2,13) = 1;
Aineq(2,14) = 1;
Aineq(2,15) = 1;
bineq(2,1) = 200000;

%third constraint (Birmingham maximum monthly throughput)
Aineq(3,1) = 1;
Aineq(3,42) = -70000;
bineq(3,1) = 0;

%fourth constraint (Greenville maximum monthly throughput)
Aineq(4,2) = 1;
Aineq(4,11) = 1;
Aineq(4,43) = -20000;
bineq(4,1) = 50000;

%fifth constraint (Gastonia maximum monthly throughput)
Aineq(5,3) = 1;
Aineq(5,12) = 1;
bineq(5,1) = 100000;

%sixth constraint (Augusta maximum monthly throughput)
Aineq(6,4) = 1;
Aineq(6,13) = 1;
Aineq(6,44) = -40000;
bineq(6,1) = 0;

%seventh constraint (Knoxville maximum monthly throughput)
Aineq(7,9) = 1;
Aineq(7,45) = -30000;
bineq(7,1) = 0;


%eighth constraint (Asheville maximum monthly througput)
Aineq(8,10) = 1;
Aineq(8,15) = 1;
Aineq(8,46) = -25000;
bineq(8,1) = 0;

%ninth constraint (only two ;left)
Aineq(9,42) = 1;
Aineq(9,44) = 1;
Aineq(9,45) = 1;
Aineq(9,46) = 1;
bineq(9,1) = 2;


%Nonnegativity constraint
%x1>= 0, -x1 <= 0

for i=1:36
Aineq(9+i,i) = -1; %x1>=0
bineq(9+i,1) = 0;
end

%Aeq coefficient matrix and beq vector
%first constraint (Input Output balance of birmingham warehouse)
Aeq(1,1) = 1;
Aeq(1,16) = -1;
Aeq(1,17) = -1;
Aeq(1,18) = -1;
Aeq(1,19) = -1;
beq(1,1) = 0;

%second constraint (Input Output balance of Greenville warehouse)
Aeq(2,2) = 1;
Aeq(2,11) = 1;
Aeq(2,20) = -1;
Aeq(2,21) = -1;
Aeq(2,22) = -1;
Aeq(2,23) = -1;
Aeq(2,24) = -1;
beq(2,1) = 0;


%third constraint (Input Output balance of Gastonia warehouse)
Aeq(3,3) = 1;
Aeq(3,12) = 1;
Aeq(3,25) = -1;
Aeq(3,26) = -1;
Aeq(3,27) = -1;
Aeq(3,28) = -1;
beq(3,1) = 0;

%fourth constraint(Input Output balance of Augusta warehouse)
Aeq(4,4) = 1;
Aeq(4,13) = 1;
Aeq(4,29) = -1;
Aeq(4,30) = -1;
Aeq(4,31) = -1;
Aeq(4,32) = -1;
beq(4,1) = 0;

%fifth constraint(Input Output balance of Augusta warehouse)
Aeq(5,9) = 1;
Aeq(5,33) = -1;
Aeq(5,34) = -1;
Aeq(5,35) = -1;
Aeq(5,36) = -1;
Aeq(5,37) = -1;
beq(5,1) = 0;

%sixth constraint(Input Output balance of Augusta warehouse)
Aeq(6,10) = 1;
Aeq(6,15) = 1;
Aeq(6,38) = -1;
Aeq(6,39) = -1;
Aeq(6,40) = -1;
Aeq(6,41) = -1;
beq(6,1) = 0;

%seventh constraint (Consumer C1 demand)
Aeq(7,5) = 1;
Aeq(7,14) = 1;
Aeq(7,20) = 1;
Aeq(7,33) = 1;
beq(7,1) = 50000;

%eigth constraint (Consumer C2 demand)
Aeq(8,16) = 1;
Aeq(8,21) = 1;
Aeq(8,25) = 1;
Aeq(8,34) = 1;
beq(8,1) = 10000;

%ninth constraint (Consumer C3 demand)
Aeq(9,6) = 1;
Aeq(9,17) = 1;
Aeq(9,22) = 1;
Aeq(9,26) = 1;
Aeq(9,29) = 1;
Aeq(9,35) = 1;
Aeq(9,38) = 1;
beq(9,1) =40000;

%tenth constraint  (Consumer C4 demand)
Aeq(10,7) = 1;
Aeq(10,18) = 1;
Aeq(10,23) = 1;
%Aeq(10,20) = 1;
Aeq(10,30) = 1;
Aeq(10,39) = 1;
beq(10,1) =35000;

%eleventh constraint (Consumer C5 demand)
Aeq(11,24) = 1;
Aeq(11,27) = 1;
Aeq(11,31) = 1;
Aeq(11,36) = 1;
Aeq(11,40) = 1;
beq(11,1) = 60000;
 
%tweleveth constraint  (Consumer C6 demand)
Aeq(12,8) = 1;
Aeq(12,19) = 1;
Aeq(12,28) = 1;
Aeq(12,32) = 1;
Aeq(12,37) = 1;
Aeq(12,41) = 1;
beq(12,1) =20000;

 Aeq(13,46) = 0;
 beq(13,1) = 0;



intcon = [42 43 44 45 46];
lb=zeros(1,46);
ub1=Inf(1,41);
ub2=[1 1 1 1 1];

ub=[ub1 ub2];


[x,fval] = intlinprog(f,intcon,Aineq,bineq,Aeq,beq,lb,ub);




%[x,fval] = linprog(f,Aineq,bineq,Aeq,beq)