%RectangularFillProfile
%Campbell Braun, homework #1, problem 1
%Sophie Coe, Grace Greer, TA Elsa

clear, clc;
%it made more sense for me to separate the question into parts
%each part uses the same logic, but I have created different versions of
%the variables for each part

%for example, T is T in part A, but T is T2 in part C


%PART A OF QUESTION 1

%declaring variables
T = 1; %year value
x = 0;
t = 31536000*T; %calculates seconds depending on T years
L = 2000;
W = 60;

%calculating G
H = 0.71; %breaking wave height
g = 9.81;
k = 0.78; %breaking ratio
s = 2.65; %specific gravity of sediment
p = 0.4; %porosity
B = 1.22; %berm height
d = 7.62; %closure depth

%longshore diffusivity in length^2/time
G = (k*H^(5/2)*sqrt(g/k))/(8*(s-1)*(1-p)*(d+B));

%evolution of a beach profile formula, remove semicolon to run
y = (W/2)*(erf((L/(4*sqrt(G*t)))*((2*x/L)+1))-erf((L/(4*sqrt(G*t)))*((2*x/L)-1)));
% gives a maximum beach width of 40.1363 m





%PART B OF QUESTION 1

%declaring variables
T1 = 10; %year value
x1 = 0;
t1 = 31536000*T1; %calculates seconds depending on T1 years
L1 = 2000;
W1 = 60; 

%evolution of a beach profile formula, remove semicolon to run
y1 = (W1/2)*(erf((L1/(4*sqrt(G*t1)))*((2*x1/L1)+1))-erf((L1/(4*sqrt(G*t1)))*((2*x1/L1)-1)));
%gives a maximum beach width of 14.4861 m





%PART C OF QUESTION 1

%declaring variables
T2 = 1; %year value
L2 = 2000;
x2 = L2/2;
t2 = 31536000*T2; %calculates seconds depending on T2 years
W2 = 60; 

%evolution of a beach profile formula, remove semicolon to run
y2 = (W2/2)*(erf((L2/(4*sqrt(G*t2)))*((2*x2/L2)+1))-erf((L2/(4*sqrt(G*t2)))*((2*x2/L2)-1)));
%gives a beach width of 13.8381
%this is 46.1619 m more than the original width (W) at this point





%PART D OF QUESTION 1

%declaring variables
L3 = 2000;
x3 = 0;
t3 = 0.1; %calculates seconds depending on T3 years
W3 = 4000; 

%evolution of a beach profile formula, remove semicolon to run
y3 = (W3/2)*(erf((L3/(4*sqrt(G*t3)))*((2*x3/L3)+1))-erf((L3/(4*sqrt(G*t3)))*((2*x3/L3)-1)));
%gives a beach width of 4000
%it takes 0.1 seconds for the fill sand to reach 4000 m from the original..
%..fill centerline



