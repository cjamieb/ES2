%LogMap
%Campbell Braun, homework 2, problem 4
%Sophie Coe, Grace Greer, Calliope Foo

clear, clc;

%PART A
r = 3.9;
X = [0.5];

for i=1:49
    X(i + 1) = r*X(i)*(1-X(i));
end
%This gives an output of X(50) = 0.9337

%==========================================================================
%PART B, remove semicolons to see output in command window

% for r value = 3.3
r = 3.3;
X = [0.5];

for i=1:49
    X(i + 1) = r*X(i)*(1-X(i));
end
plot (X, 'g-')
xlabel('Iteration Number'), ylabel('X value'), title('Effect of Change in r value on X')

hold on

% for r value = 2.1
r = 2.1;
X = [0.5];

for i=1:49
    X(i + 1) = r*X(i)*(1-X(i));
end
plot (X, 'b-')

% for r value = 1.2
r = 1.2;
X = [0.5];

for i=1:49
    X(i + 1) = r*X(i)*(1-X(i));
end
plot (X, 'r-')

% for r value = 3
r = 3;
X = [0.5];

for i=1:49
    X(i + 1) = r*X(i)*(1-X(i));
end
plot (X, 'm-')

legend('r = 3.3', 'r = 2.1', 'r = 1.2', 'r = 3')

%Answer:

%The smallest r value yields the smallest X values with very little
%variation in the values
%However, the largest r value yields the X values with the most variation
%The correlation between the X values for r=1.2 and r =2.1 look like lines
%However, the correlation between the X values for r=3 and r=3.3 almost 
%look like waves