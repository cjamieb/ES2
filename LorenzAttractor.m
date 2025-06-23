%Lorenz attractor
%Campbell Braun, homework 2, problem 3
%Sophie Coe, Grace Greer, Calliope Foo, TA Johnathan, Chelsea

clear,clc;

%variables for parts a through c
o = 10; %o = sigma
b = 8/3;
r = 28;
dt = 0.01;

X = [1];
Y = [2];
Z = [3];

%==========================================================================
%PART A, remove semicolons to see output in command window
for i = 1:9
    X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
    Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
    Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
   
%Answers: 
% X = [1, 1.1, 1.23, 1.34, 1.4823, 1.6414, 1.8188, 2.0165, 2.2365, 2.4812]
% Y = [2, 2.23, 2.4834, 2.7632, 3.0727, 3.4155, 3.7954, 4.2167, 4.6837,
% 5.2013]
% Z = [3, 2.94, 2.8861, 2.8393, 2.8006, 2.7715, 2.7536, 2.7492, 2.7609,
% 2.7921]

%==========================================================================
%PART B
plot3(X, Y, Z);
hold on
title('Lorenz Attractor')
xlabel('X Value')
ylabel('Y Value')
zlabel('Z Value')

%==========================================================================
%PART C, remove semicolons to see output in command window
for i = 1:99
    X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
    Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
    Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
%X(10) is 2.48, but X(100) is -6.2419 (The result decreases)
%Y(10) is 5.20, but Y(100) is -8.3995 (The result decreases)
%Z(10) is 2.79, but Z(100) is 20.4576 (The result increases)

for i = 1:999
    X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
    Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
    Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
%X(100) is -6.2419, but X(1000) is -3.7369 (The result increases)
%Y(100) is -8.3995, but Y(1000) is -5.6867 (The result increases)
%Z(100) is 20.4576, but Z(1000) is 20.2370 (The result decreases)

for i = 1:9999
    X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
    Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
    Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
%X(1000) is -3.7369, but X(10000) is 14.2029 (The result increases)
%Y(1000) is -5.6867, but Y(10000) is 24.0434 (The result increases)
%Z(1000) is 20.2370, but Z(10000) is 21.7877 (The result increases)

%==========================================================================
%PART D, remove semicolons to see output in command window
o = 10;
b = 8/3;
r = 28;
dt = 0.01;

%I increased the values of X, Y, and Z by a factor of 4
X = [4]; 
Y = [8];
Z = [12];

for i = 1:9
    X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
    Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
    Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers: 
% X = [4, 4.4, 4.816, 5.2522, 5.7125, 6.1999, 6.7173, 7.2668, 7.8498, 8.4669]
%X(10) was 2.48, but X(10) is now 8.4669 (The result increased)
% Y = [8, 8.56, 9.1784, 9.8544, 10.5870, 11.3739, 12.2122, 13.0968, 14.9732]
%Y(10) was  5.20, but Y(10) is now 14.9732 (The result increased)
% Z = [12, 12, 12.0566, 12.1772, 12.37, 12.6449, 13.0129, 13.4862, 14.0783, 14.8035]
%Z(10) was 2.79, but Z(10) is now 14.8035 (The result increased)

for i = 1:99
    X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
    Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
    Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
%X(100) was -6.2419, but X(100) is now -7.0578 (The result decreased)
%Y(100) was -8.3995, but Y(100) is now -2.5221 (The result increased)
%Z(100) was 20.4576, but Z(100) is now 30.662 (The result increased)

for i = 1:999
    X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
    Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
    Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
%X(1000) was -3.7369, but X(1000) is now -8.3883 (The result decreased)
%Y(1000) was -5.6867, but Y(1000) is now -0.7499 (The result increased)
%Z(1000) was 20.2370, but Z(1000) is now 34.5896 (The result increased)

for i = 1:9999
    X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
    Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
    Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
%X(10000) was 14.2029, but X(10000) is now -8.1458 (The result decreased)
%Y(10000) was 24.0434, but Y(10000) is now -12.6177 (The result decreased)
%Z(10000) was 21.7877, but Z(10000) is now 18.9134 (The result decreased)

%==========================================================================
%PART E
%Note for my answers to part E:
%The X,Y,Z values here are compared to their values from part A, not D

%Test One: only changing o (sigma) by a factor of 4
o = 40;
b = 8/3;
r = 28;
dt = 0.01;

%I reverted X, Y, and Z back to their original values from part a
X = [1]; 
Y = [2];
Z = [3];

for i = 1:9
    X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
    Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
    Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers: 
% X = [1, 1.4, 1.73, 2.0626, 2.4247, 2.8375, 3.3153, 3.8713, 4.5190, 5.2733]
%X(10) was 2.48, but X(10) is now 5.2733 (The result increased)
% Y = [2, 2.23, 2.5585, 2.9678, 3.4567, 4.0320, 4.7053, 5.4906, 6.4047, 7.4658]
%Y(10) was  5.20, but Y(10) is now 7.4658 (The result increased)
% Z = [3, 2.94, 2.8928, 2.86, 2.8449, 2.8529, 2.8912, 2.9701, 3.1035, 3.3101]
%Z(10) was 2.79, but Z(10) is now 3.3101 (The result increased)

for i = 1:99
    X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
    Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
    Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
%X(100) was -6.2419, but X(100) is now -1.9963 (The result increased)
%Y(100) was -8.3995, but Y(100) is now -2.6733 (The result increased)
%Z(100) was 20.4576, but Z(100) is now 8.1776 (The result decreased)

for i = 1:999
    X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
    Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
    Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
%X(1000) was -3.7369, but X(1000) is now -16.1574 (The result decreased)
%Y(1000) was -5.6867, but Y(1000) is now -19.458 (The result decreased)
%Z(1000) was 20.2370, but Z(1000) is now 20.4801 (The result increased)

for i = 1:9999
    X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
    Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
    Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
%X(10000) was 14.2029, but X(10000) is now -16.1574 (The result decreased)
%Y(10000) was 24.0434, but Y(10000) is now -19.458 (The result decreased)
%Z(10000) was 21.7877, but Z(10000) is now 20.4801 (The result decreased)

%This relationship is hard to describe, but I believe sigma affects the
%system by making the derivative of the difference between Y(i) and X(i) smaller or larger


%Test Two: only changing b by a factor of 4
o = 10;
b = 32/3;
r = 28;
dt = 0.01;

X = [1];
Y = [2];
Z = [3];

for i = 1:9
   X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
   Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
   Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
% X = [1, 1.1, 1.213, 1.3403, 1.4834, 1.644, 1.824, 2.0255, 2.251, 2.5032]
%X(10) was 2.48, but X(10) is now 2.5032 (The result increased)
% Y = [2, 2.23, 2.486, 2.7712, 3.0892, 3.4439, 3.8395, 4.2808, 4.773, 5.3216]
%Y(10) was  5.20, but Y(10) is now 5.3216 (The result increased)
% Z = [3, 2.7, 2.4365, 2.2068, 2.0085, 1.8401, 1.7005, 1.5891, 1.5063, 1.4531]
%Z(10) was 2.79, but Z(10) is now 1.4531 (The result decreased)
for i = 1:99
   X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
   Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
   Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
%X(100) was -6.2419, but X(100) is now 11.6397 (The result increased)
%Y(100) was -8.3995, but Y(100) is now 18.5604 (The result increased)
%Z(100) was 20.4576, but Z(100) is now 13.6396 (The result decreased)
for i = 1:999
   X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
   Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
   Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
%X(1000) was -3.7369, but X(1000) is now 16.9023 (The result increased)
%Y(1000) was -5.6867, but Y(1000) is now 16.9802 (The result increased)
%Z(1000) was 20.2370, but Z(1000) is now 26.836 (The result increased)
for i = 1:9999
   X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
   Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
   Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
%X(10000) was 14.2029, but X(10000) is now 16.9706 (The result increased)
%Y(10000) was 24.0434, but Y(10000) is now 16.9706 (The result decreased)
%Z(10000) was 21.7877, but Z(10000) is now 27 (The result increased)

%This relationship is hard to describe, but I believe b affects the system
%by making the derivative of the difference between {the product of [X(i) &
%Y(i)] and the value of Z(i)} smaller or larger


%Test Three: only changing r by a factor of 2
%(I did by a factor of 2 instead of 4 because the outputs were too large
%that MATLAB was giving me errors)
o = 10;
b = 8/3;
r = 56;
dt = 0.01;
%I reverted X, Y, and Z back to their original values from part a
X = [1];
Y = [2];
Z = [3];
for i = 1:9
   X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
   Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
   Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
% X = [1, 1.1, 1.241, 1.4238, 1.6511, 1.9276, 2.2599, 2.6562, 3.1268, 3.684]
%X(10) was 2.48, but X(10) is now 3.684 (The result increased)
% Y = [2, 2.51, 3.0686, 3.697, 4.4167, 5.2505, 6.223, 7.3619, 8.6984, 10.2676]
%Y(10) was  5.20, but Y(10) is now 10.2676 (The result increased)
% Z = [3, 2.94, 2.8892, 2.8502, 2.8269, 2.8244, 2.8503, 2.9149, 3.0328, 3.2239]
%Z(10) was 2.79, but Z(10) is now 3.2239 (The result increased)
for i = 1:99
   X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
   Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
   Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
%X(100) was -6.2419, but X(100) is now 1.9486 (The result increased)
%Y(100) was -8.3995, but Y(100) is now 4.2981 (The result increased)
%Z(100) was 20.4576, but Z(100) is now 38.7455 (The result increased)
for i = 1:999
   X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
   Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
   Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
%X(1000) was -3.7369, but X(1000) is now 3.0718 (The result increased)
%Y(1000) was -5.6867, but Y(1000) is now 5.7165 (The result increased)
%Z(1000) was 20.2370, but Z(1000) is now 32.3422 (The result increased)
for i = 1:9999
   X(i + 1) = X(i) + o*(Y(i) - X(i))*dt;
   Y(i + 1) = Y(i) + (X(i)*(r - Z(i))-Y(i))*dt;
   Z(i + 1) = Z(i) + (X(i)*Y(i) - b*Z(i))*dt;
end
%Answers:
%X(10000) was 14.2029, but X(10000) is now -16.5963 (The result decreased)
%Y(10000) was 24.0434, but Y(10000) is now -11.3994 (The result decreased)
%Z(10000) was 21.7877, but Z(10000) is now 66.9535 (The result increased)

%This relationship is hard to describe, but I believe r affects the system
%by making the factor of X(i) in the derivative of the difference between
%X(i) and Y(i) larger or smaller 

