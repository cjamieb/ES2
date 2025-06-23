
Xasian = AsianMajority.Med_HHD_Inc_ACS_09_13;
Yasian = AsianMajority.normalized_existing_installation;

Xblack = BlackMajority.Med_HHD_Inc_ACS_09_13;
Yblack = BlackMajority.normalized_existing_installation;

Xhispanic = HispanicMajority.Med_HHD_Inc_ACS_09_13;
Yhispanic = HispanicMajority.normalized_existing_installation;

Xwhite = WhiteMajority.Med_HHD_Inc_ACS_09_13;
Ywhite = WhiteMajority.normalized_existing_installation;

Xno = NoMajority.Med_HHD_Inc_ACS_09_13;
Yno = NoMajority.normalized_existing_installation;

span = 0.8;

%THIS PART OF THE CODE ONLY PLOTS ONE CT GROUP AT A TIME!

%uncomment one of the following CTgroups in order to run Lowess and Lowess Bootstrap

% CTgroup = 'Black CT';
%CTgroup = 'White CT';
%CTgroup = 'Asian CT';
%CTgroup = 'Hispanic CT';
% CTgroup = 'No Majority CT';
%if strcmp(CTgroup,'Black CT')
%x = Xblack; y = Yblack;
%elseif strcmp(CTgroup,'White CT')
%x = Xwhite; y = Ywhite;
%elseif strcmp(CTgroup,'Asian CT')
%x = Xasian; y = Yasian;
%elseif strcmp(CTgroup,'Hispanic CT')
%x = Xhispanic; y = Yhispanic;
%elseif strcmp(CTgroup,'No Majority CT')
%x = Xno; y = Yno;
%end

%[YLowess, MSE] = LowessSmoothing(y, span); % to just plot lowess line & get MSE
% NOTE: this one plots, so turn off the plot here if using
%YLowess = LowessBootPlot(x,y,span,'magenta'); % to get and plot CI band
%figure
%semilogx(x,y,'bo')
%hold on
%semilogx(x,YLowess,'k','LineWidth',2)
%xlabel('median income'), ylabel('solar install'), legend('data','lowess fit'),
%title([data.state_name{1},', ' ,CTgroup,', ' ,'span = ', num2str(span)])

%=========================================================================
%CODE TO PLOT OF ALL THE CT GROUPS
CTgroup = 'Black CT';
if strcmp(CTgroup,'Black CT')
x = Xblack; y = Yblack;
elseif strcmp(CTgroup,'White CT')
x = Xwhite; y = Ywhite;
elseif strcmp(CTgroup,'Asian CT')
x = Xasian; y = Yasian;
elseif strcmp(CTgroup,'Hispanic CT')
x = Xhispanic; y = Yhispanic;
elseif strcmp(CTgroup,'No Majority CT')
x = Xno; y = Yno;
end
[YLowess, MSE] = LowessSmoothing(y, span);
figure
semilogx(x,YLowess,'y','LineWidth',2)
hold on
xlabel('median income'), ylabel('solar install'), legend('Black CT'),
title([data.state_name{1},' Lowess Fits, ' ,'span = ', num2str(span)])

CTgroup2 = 'White CT';
if strcmp(CTgroup2,'Black CT')
x2 = Xblack; y2 = Yblack;
elseif strcmp(CTgroup2,'White CT')
x2 = Xwhite; y2 = Ywhite;
elseif strcmp(CTgroup2,'Asian CT')
x2 = Xasian; y2 = Yasian;
elseif strcmp(CTgroup2,'Hispanic CT')
x2 = Xhispanic; y2 = Yhispanic;
elseif strcmp(CTgroup2,'No Majority CT')
x2 = Xno; y2 = Yno;
end
[YLowess2, MSE] = LowessSmoothing(y2, span);
semilogx(x2,YLowess2,'g','LineWidth',2)

CTgroup3 = 'Asian CT';
if strcmp(CTgroup3,'Black CT')
x3 = Xblack; y3 = Yblack;
elseif strcmp(CTgroup3,'White CT')
x3 = Xwhite; y3 = Ywhite;
elseif strcmp(CTgroup3,'Asian CT')
x3 = Xasian; y3 = Yasian;
elseif strcmp(CTgroup3,'Hispanic CT')
x3 = Xhispanic; y3 = Yhispanic;
elseif strcmp(CTgroup3,'No Majority CT')
x3 = Xno; y3 = Yno;
end
[YLowess3, MSE] = LowessSmoothing(y3, span);
semilogx(x3,YLowess3,'b','LineWidth',2)

CTgroup4 = 'Hispanic CT';
if strcmp(CTgroup4,'Black CT')
x4 = Xblack; y4 = Yblack;
elseif strcmp(CTgroup4,'White CT')
x4 = Xwhite; y4 = Ywhite;
elseif strcmp(CTgroup4,'Asian CT')
x4 = Xasian; y4 = Yasian;
elseif strcmp(CTgroup4,'Hispanic CT')
x4 = Xhispanic; y4 = Yhispanic;
elseif strcmp(CTgroup4,'No Majority CT')
x4 = Xno; y4 = Yno;
end
[YLowess4, MSE] = LowessSmoothing(y4, span);
semilogx(x4,YLowess4,'r','LineWidth',2)

CTgroup5 = 'No Majority CT';
if strcmp(CTgroup5,'Black CT')
x5 = Xblack; y5 = Yblack;
elseif strcmp(CTgroup5,'White CT')
x5 = Xwhite; y5 = Ywhite;
elseif strcmp(CTgroup5,'Asian CT')
x5 = Xasian; y5 = Yasian;
elseif strcmp(CTgroup5,'Hispanic CT')
x5 = Xhispanic; y5 = Yhispanic;
elseif strcmp(CTgroup5,'No Majority CT')
x5 = Xno; y5 = Yno;
end
[YLowess5, MSE] = LowessSmoothing(y5, span);
semilogx(x5,YLowess5,'m','LineWidth',2)

legend('Black CT','White CT','Asian CT','Hispanic CT','No Majority CT')
