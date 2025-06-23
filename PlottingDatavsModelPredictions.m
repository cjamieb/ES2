%Plotting Data vs. Model Predictions
%Campbell Braun, homework 2, problem 1
%Sophie Coe, Grace Greer

clear, clc;

%PART A
V = [0, 10, 20, 30, 40, 50, 60, 70, 80];
MF = [0, 25, 70, 380, 550, 610, 1220, 830, 1450]; %measured force
PF = [0]; %predicted force

for i=1:9
    PF(i) = 0.271 * MF(i)^1.91;
end


plot (V, MF, 'md')
hold on
plot(V, PF, 'k-') %plotting the theoretical equation line
axis ([0 100 0 300000])
yscale('log')
title('Measured Force vs. Predicted Force on an Object')
legend('Measured Force', 'Predicted Force')
xlabel('Velocity (m/s)')
ylabel('Force (N)')

%PART B

total = 0;

for i=1:9
    c = PF(i) - MF(i);
    total = total + c;
end

RMSE = sqrt((total^2)/9)

%The value of the RMSE is 2.4418e+05, which is in Newtons, so 2.4418e+05 N



