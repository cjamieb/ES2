
clear, clc;

L = 100;
num = 0;

while L > 0.01
    L = L/2;
    num = num + 1;
end

disp("Trip number = " + num)