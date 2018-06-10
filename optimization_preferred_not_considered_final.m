%%Rojan Bhattarai
%%Optimization Course Project


clear all;
close all;
clc;

f = zeros(1,29);  %in order of x1, x2, x3


%objective function, first variable
f  = [80 60 120 80 160 240 320 160 60 30 80 320 240 80 240 160 160 80 80 160 80 240 320 80 240 40 240 80 240];



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
bineq(1,1) = 150000;

%second constraint (Charlotte Monthly Production Capacity)
Aineq(2,9) = 1;
Aineq(2,10) = 1;
Aineq(2,11) = 1;
Aineq(2,12) = 1;
bineq(2,1) = 200000;

%third constraint (Birmingham maximum monthly throughput)
Aineq(3,1) = 1;
bineq(3,1) = 70000;

%fourth constraint (Greenville maximum monthly throughput)
Aineq(4,2) = 1;
Aineq(4,9) = 1;
bineq(4,1) = 50000;

%fifth constraint (Gastonia maximum monthly throughput)
Aineq(5,3) = 1;
Aineq(5,10) = 1;
bineq(5,1) = 100000;

%sixth constraint (Augusta maximum monthly throughput)
Aineq(6,4) = 1;
Aineq(6,11) = 1;
bineq(6,1) = 40000;

%Nonnegativity constraint
%x1>= 0, -x1 <= 0

for i=1:29
Aineq(6+i,i) = -1; %x1>=0
bineq(6+i,1) = 0;
end

%Aeq coefficient matrix and beq vector
%first constraint (Input Output balance of birmingham warehouse)
Aeq(1,1) = 1;
Aeq(1,13) = -1;
Aeq(1,14) = -1;
Aeq(1,15) = -1;
Aeq(1,16) = -1;
beq(1,1) = 0;

%second constraint (Input Output balance of Greenville warehouse)
Aeq(2,2) = 1;
Aeq(2,9) = 1;
Aeq(2,17) = -1;
Aeq(2,18) = -1;
Aeq(2,19) = -1;
Aeq(2,20) = -1;
Aeq(2,21) = -1;
beq(2,1) = 0;


%third constraint (Input Output balance of Gastonia warehouse)
Aeq(3,3) = 1;
Aeq(3,10) = 1;
Aeq(3,22) = -1;
Aeq(3,23) = -1;
Aeq(3,24) = -1;
Aeq(3,25) = -1;
beq(3,1) = 0;

%fourth constraint(Input Output balance of Augusta warehouse)
Aeq(4,4) = 1;
Aeq(4,11) = 1;
Aeq(4,26) = -1;
Aeq(4,27) = -1;
Aeq(4,28) = -1;
Aeq(4,29) = -1;
beq(4,1) = 0;

%fifth constraint (Consumer C1 demand)
Aeq(5,5) = 1;
Aeq(5,12) = 1;
Aeq(5,17) = 1;
beq(5,1) = 50000;

%sixth constraint (Consumer C2 demand)
Aeq(6,13) = 1;
Aeq(6,18) = 1;
Aeq(6,22) = 1;
beq(6,1) = 10000;

%seventh constraint (Consumer C3 demand)
Aeq(7,6) = 1;
Aeq(7,14) = 1;
Aeq(7,19) = 1;
Aeq(7,23) = 1;
Aeq(7,26) = 1;
beq(7,1) =40000;

%eigth constraint  (Consumer C4 demand)
Aeq(8,7) = 1;
Aeq(8,15) = 1;
Aeq(8,20) = 1;
Aeq(8,27) = 1;
beq(8,1) =35000;

%ninth constraint (Consumer C5 demand)
Aeq(9,21) = 1;
Aeq(9,24) = 1;
Aeq(9,28) = 1;
beq(9,1) = 60000;
 
%tenth constraint  (Consumer C6 demand)
Aeq(10,8) = 1;
Aeq(10,16) = 1;
Aeq(10,25) = 1;
Aeq(10,29) = 1;
beq(10,1) =20000;




[x,fval] = linprog(f,Aineq,bineq,Aeq,beq)