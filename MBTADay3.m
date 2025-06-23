% MBTA_elasticity_inclass
clear, clc

F1bus = [1.7, 1.7, 1.7, 1.7, 1.7, 1.7, 1.7, 1.7, 1.7, 1.7, 1.7] % current bus fare
F1subway = [2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4] % current subway fare
F1CR = [8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0]; % current CR fare 
R1bus = [1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8]; % initial bus ridership
R1subway = [2E8, 2E8, 2E8, 2E8, 2E8, 2E8, 2E8, 2E8, 2E8, 2E8, 2E8]; % initial subway ridership
R1CR = [3E7, 3E7, 3E7, 3E7, 3E7, 3E7, 3E7, 3E7, 3E7, 3E7, 3E7]; % initial CR ridership
E = -0.25;  % Elasticity

% Choose new fare(s) (New Fare)
% hint: start with single number, then try a range
%F2 = [1.9, 2.0, 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9, 3.0, 3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 4.0, 4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 4.7, 4.8, 4.9, 5.0];     % new fare - choose this number
F2 = [1000, 1010, 1020, 1030, 1040, 1050, 1060, 1070, 1080, 1090, 1100]

% Calculate old revenue 
Rev1bus = [F1bus.*R1bus]
Rev1subway = [F1subway.*R1subway] 
Rev1CR = [F1CR.*R1CR]; % initial revenue

% Calculate new ridership using elasticity (E)
R2bus = [(E*((F2-F1bus)./F1bus).*R1bus + R1bus)] % new ridership
R2subway = [(E*((F2-F1subway)./F1subway).*R1subway + R1subway)]
R2CR = [(E*((F2-F1CR)./F1CR).*R1CR + R1CR)]

% Calculate new revenue 
Rev2bus = F2.*R2bus;   % new revenue
Rev2subway = F2.*R2subway; 
Rev2CR = F2.*R2CR; 

% Calculate change in revenue
Rev_changebus = (Rev2bus-Rev1bus)/1000000; % change in revenue
Rev_changesubway = (Rev2subway-Rev1subway)/1000000;
Rev_changeCR = (Rev2CR-Rev1CR)/1000000;


%Calculate change in ridership
RChangebus = R2bus - R1bus;
RChangesubway = R2subway - R1subway;
RChangeCR = R2CR - R1CR;

%Calculate % of additional income
P_AIncome_LIbus = (F2 - F1bus)*780/24000
P_AIncome_LIsubway = (F2 - F1subway)*780/24000
P_AIncome_LICR = (F2 - F1CR)*780/24000

P_AIncome_NotLIbus = (F2 - F1bus)*780/113000
P_AIncome_NotLIsubway = (F2 - F1subway)*780/113000
P_AIncome_NotLICR = (F2 - F1CR)*780/113000

% plots
subplot 411
plot(F2,Rev_changebus,F2,Rev_changesubway,F2,Rev_changeCR,'-*'), title('Revenue Change vs. Fare')
legend('bus', 'subway', 'commuter rail')
xlabel('Fare ($)')
ylabel('Change in Revenue (Millions of Dollars) ')

subplot 412
plot(F2,RChangebus,F2,RChangesubway,F2,RChangeCR,'-*'), title('Ridership Change vs. Fare')
legend('bus', 'subway', 'commuter rail')
xlabel('Fare ($)')
ylabel('Change in Ridership (People) ')

subplot 413
plot(F2-F1bus,P_AIncome_LIbus,F2-F1subway,P_AIncome_LIsubway,F2-F1CR,P_AIncome_LICR,'-*'), title('Additional Income vs. Fare Change for Low Income Families')
xlabel('Fare ($)')
ylabel('Additional Income (%)')

subplot 414
plot(F2-F1bus,P_AIncome_NotLIbus,F2-F1subway,P_AIncome_NotLIsubway,F2-F1CR,P_AIncome_NotLICR, '-*'), title('Additional Income vs. Far Change for Non-Low Income Families')
xlabel('Fare ($)')
ylabel('Additional Income (%)')

%Proposed fare changes
F3bus = 2.20
F3subway = 2.60
F3CR = 10.00

% Calculate change in ridership using elasticity (E)
R3bus = [(E*((F3bus-F1bus)./F1bus).*R1bus + R1bus)]; % new ridership
R3subway = [(E*((F3subway-F1subway)./F1subway).*R1subway + R1subway)];
R3CR = [(E*((F3CR-F1CR)./F1CR).*R1CR + R1CR)];

%Calculate the new Revenue
Rev3bus = F3bus.*R3bus;   % new revenue
Rev3subway = F3subway.*R3subway; 
Rev3CR = F3CR.*R3CR; 

%Calculate Total Increase in Revenue
Rev_Increasebus = (Rev3bus-Rev1bus)/1000000 % change in revenue
Rev_Increasesubway = (Rev3subway-Rev1subway)/1000000
Rev_IncreaseCR = (Rev3CR-Rev1CR)/1000000

%Setting Initial Ridership by Income Group
R4busLI = [42000000]; % initial bus ridership
R4subwayLI = [52000000]; % initial subway ridership
R4CRLI = [2100000]; % initial CR ridership

R4busnotLI = [58000000]; % initial bus ridership
R4subwaynotLI = [148000000]; % initial subway ridership
R4CRnotLI = [27900000]; % initial CR ridership

%Calculate Change in Ridership by Income Group
R5busLI = [(E*((F3bus-F1bus)./F1bus).*R4busLI + R4busLI)] % new ridership
R5subwayLI = [(E*((F3subway-F1subway)./F1subway).*R4subwayLI + R4subwayLI)]
R5CRLI = [(E*((F3CR-F1CR)./F1CR).*R4CRLI + R4CRLI)]

R5busnotLI = [(E*((F3bus-F1bus)./F1bus).*R4busnotLI + R4busnotLI)] % new ridership
R5subwaynotLI = [(E*((F3subway-F1subway)./F1subway).*R4subwaynotLI + R4subwaynotLI)]
R5CRnotLI = [(E*((F3CR-F1CR)./F1CR).*R4CRnotLI + R4CRnotLI)]

%Calculate the wide system impact factor
P_AIncome_LIbus = (F3bus - F1bus)*780/24000;
P_AIncome_LIsubway = (F3subway - F1subway)*780/24000;
P_AIncome_LICR = (F3CR - F1CR)*780/24000;

P_AIncome_NotLIbus = (F3bus - F1bus)*780/113000;
P_AIncome_NotLIsubway = (F3subway - F1subway)*780/113000;
P_AIncome_NotLICR = (F3CR - F1CR)*780/113000;

AdditionalIncomePct_LI = [P_AIncome_LIbus(1),P_AIncome_LIsubway(1),P_AIncome_LICR(1)];
AdditionalIncomePct_notLI = [P_AIncome_NotLIbus(1),P_AIncome_NotLIsubway(1),P_AIncome_NotLICR(1)];

Ridership_LI = [R5busLI(1),R5subwayLI(1),R5CRLI(1)];
Ridership_notLI = [R5busnotLI(1),R5subwaynotLI(1),R5CRnotLI(1)];

Impact_LI = AdditionalIncomePct_LI.*Ridership_LI;
Impact_notLI = AdditionalIncomePct_notLI.*Ridership_notLI;

ImpactSystem = (Impact_LI(1) + Impact_LI(2) + Impact_LI(3))./(Impact_notLI(1) + Impact_notLI(2) + Impact_notLI(3))





