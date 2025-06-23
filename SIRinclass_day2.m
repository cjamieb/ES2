clear, clc;

%inputs

Ndays = 100;
Npeople = 1000;

%SIR parameters

B = 0.5; %bigger value = infecting more
gamma = 0.1; %smaller value = more chances to infect

% starting conditions

I0 = 1;
%R0 = 0;
%S0 = Npeople - I - R;

dt = 1; %day

% do simulation

I = zeros([1,Ndays]);
R = zeros([1,Ndays]);
S = zeros([1,Ndays]);
V = zeros([1,Ndays]);

I(1) = I0;
R(1) = 0;
V(1) = 0;
S(1) = Npeople - I(1) - R(1) - V(1);

CInfections = [0]

u = 0.2 %setting vaccination rate to 40%

for i = 1:Ndays
    NewInfections = B.*I(i).*S(i)./Npeople*dt;
    Nrecovered = gamma.*I(i).*dt;

    I(i+1) = I(i) + NewInfections - Nrecovered;
    R(i+1) = R(i) + Nrecovered;
    V(i+1) = V(i) + (u.*S(i).*dt)

    CInfections(i + 1) = CInfections(i) + I(i)

    if i > 20
        S(i+1) = 0.02*Npeople;
    else
        S(i+1) = S(i) - NewInfections;
    end

end

%plot

figure(1)
days = 0:Ndays;
plot(days,S,days,I,days,R, days, V)
legend('S','I','R','V')
xlabel('time (days)')
ylabel('# people')

title(['\beta= ' num2str(B) ' \gamma= ' num2str(gamma)])

figure(2)
plot(days,I)
xlabel('time (days)')
ylabel('infection rate (transmissions/day)')

title('New Transmissions Each Day')

figure(3)
plot(days,CInfections)
xlabel('time (days)')
ylabel('cummulative infections (infected people/day)')

title('Cummulative Infections Per Day')



