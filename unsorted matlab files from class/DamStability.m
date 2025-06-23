%DamStability
%Campbell Braun, homework #1, problem 2
%Sophie Coe, Grace Greer

clear, clc;
%it made more sense for me to separate the question into parts
%each part uses the same logic, but I have created different versions of
%the variables for each part

%for example, B is B in part A, but B is B2 in part C



%PART A OF QUESTION 2

%declaring variables
B = 15; %width of the dam
H = 40; %height of the dam
hd = 10; %downstream water depth
pc = 2400; %density of concrete
p = 1000; %density of water
u = 0.7; %sliding friction coefficient
hu = 27; %upstream water depth

%sliding inequality, remove semicolon to run
hu^2 - hd^2 < u * ((pc/p) * (B*H) + hd^2 * (B/H) - (2*hd*B) - ((hu-hd) * B));

%overturning inequality, remove semicolon to run
hu^3 + (3*hd*B^2) + ((2*B^2)*(hu-hd)) < (2*(pc/p)*B^2*H) + hd^3 + ((hd^3)*(B/H)^2);

%at hu=1 and hu=27, both inequalities return true, so the dam is stable
%every value of hu from 1-27 returns true, so this is the range of hu




%PART B OF QUESTION 2

%declaring variables
B1 = 15; %width of the dam
H1 = 40; %height of the dam
hd1 = 0; %downstream water depth
pc1 = 2400; %density of concrete
p1 = 1000; %density of water
u1 = 0.7; %sliding friction coefficient
hu1 = 27; %upstream water depth

%sliding inequality, remove semicolon to run
hu1^2 - hd1^2 < u1 * ((pc1/p1) * (B1*H1) + hd1^2 * (B1/H1) - (2*hd1*B1) - ((hu1-hd1) * B1));

%overturning inequality, remove semicolon to run
hu1^3 + (3*hd1*B1^2) + ((2*B1^2)*(hu1-hd1)) < (2*(pc1/p1)*B1^2*H1) + hd1^3 + ((hd1^3)*(B1/H1)^2);

%the dam is not stable in condition (a) if hd=0
%this is because the 1st inequality returns false, but the 2nd returns true




%PART C OF QUESTION 2

%declaring variables
B2 = 45; %width of the dam
H2 = 40; %height of the dam
hd2 = 10; %downstream water depth
pc2 = 2400; %density of concrete
p2 = 1000; %density of water
u2 = 0.7; %sliding friction coefficient
hu2 = 40; %upstream water depth

%sliding inequality, remove semicolon to run
hu2^2 - hd2^2 < u2 * ((pc2/p2) * (B2*H2) + hd2^2 * (B2/H2) - (2*hd2*B2) - ((hu2-hd2) * B2));

%overturning inequality, remove semicolon to run
hu2^3 + (3*hd2*B2^2) + ((2*B2^2)*(hu2-hd2)) < (2*(pc2/p2)*B2^2*H2) + hd2^3 + ((hd2^3)*(B2/H2)^2);

% a width of 40 m is needed to ensure the dam is always stable for any hu
% even though the dam is not stable at hu=39, 
% I do not believe this is possible because hu has to be smaller than H
% and this seems to be too close to H


