% solar_day2
clear

% MAKE SURE DAY 1 CODE IS DOING WHAT YOU WANT!!!
% CORRECT STATE, CORRECT VARIABLE, ETC.

ProjectSolarDay1;
% this creates in the workspace:
%   data - table of california only
%   WhiteMajority - table with just census tracks White > 50%
%   AsianMajority 
%   BlackMajority
%   HispanicMajority 
%   NoMajority

data.state_name{1}
% y variable: normalized_existing_installation
% x variable: Med_HHD_Inc_ACS_09_13

xWhite = WhiteMajority.Med_HHD_Inc_ACS_09_13;
yWhite = WhiteMajority.normalized_existing_installation;

xHispanic = HispanicMajority.Med_HHD_Inc_ACS_09_13;
yHispanic = HispanicMajority.normalized_existing_installation;

xBlack = BlackMajority.Med_HHD_Inc_ACS_09_13;
yBlack = BlackMajority.normalized_existing_installation;

xAsian= AsianMajority.Med_HHD_Inc_ACS_09_13;
yAsian = AsianMajority.normalized_existing_installation;

% visualize just white vs. hispanic
% semilogx(xWhite,yWhite,'.', xHispanic,yHispanic,'r.')

% fit curve --------------------

polyorder = 8;

MSEBlack = MSE_PolyFitPlot(xBlack,yBlack,polyorder);    % best fit of given poly order
%Black_CI = PolyBootstrapPlot(xBlack,yBlack,polyorder,'green');  % boostrap with that poly order

%MSEWhite= MSE_PolyFitPlot(xWhite,yWhite,polyorder);
%White_CI= PolyBootstrapPlot(xWhite,yWhite,polyorder,'red');

% MSEHispanic= MSE_PolyFitPlot(xHispanic,yHispanic,polyorder);
%Hispanic_CI = PolyBootstrapPlot(xHispanic,yHispanic,polyorder,'blue');

% MSEAsian= MSE_PolyFitPlot(xAsian,yAsian,polyorder);
%Asian_CI = PolyBootstrapPlot(xAsian,yAsian,polyorder,'magenta');

