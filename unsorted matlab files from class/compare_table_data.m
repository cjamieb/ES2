% compare_table_data
clear, clc

% Data from table: time (s) & Height (in)
time = [.03,.0633,.0967,.13,.1633,.1967,.23,.2633,.2967]; % s
hmeas = [22,21.5,20.5,18.8,17,14.5,12,8,3]; % in

% Gravity constant (in/s^2)
g = 386.4;

% height as given by equation
hpred = 22-(1/2).*g.*time.^2;

hdiff = hmeas - hpred
avgdiff = mean(hdiff)


[maxdiff, Imax] = max(abs(hdiff));
tmaxdiff = time(Imax)

N = length(hmeas);
MAE = sum(abs(hmeas-hpred))./length(hmeas)
RMSE = sqrt(sum((hmeas-hpred).^2)./N)


% plot the results
figure
plot(time,hmeas,'md',time,hpred,'bl', 'LineWidth', 2)
xlabel('Time (s)')
ylabel('Height (in)')
legend('Measured Data','Theoretical Values')
ylim([0,25])
xlim([0,.35])


