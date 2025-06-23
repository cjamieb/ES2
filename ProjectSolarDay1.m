%% Solar Module


%% Introduction
% This Data Lab explores energy injustice by determining whether there
% exists statistically significant differences in teh rooftop solar
% adoption between racial/ethnic groups. There is a long history of energy
% injustice in the United States. 75% of African American live within 30
% miles of coal-fired power plants, a radius within which the health
% effects of the emissions are most harmful. It is important to recognize
% that injustice exists not only when a group is marginalized with uneven
% burdens, such as exposure to pollution but also when a group is excluded
% from benefits. Rooftop solar allows the household to receive a variety of
% benefits such as tax credits, rebates, lower cost of electricity, etc.
% This analysis was performed at the national level in "Disparities in
% Rooftop Photovoltaic Deployment in the United States by Race and
% Ethnicity" by Sunter, Castellanos, and Kammen. For this module, you will
% be using the census data from the American Community Survey and rooftop
% solar data from Google Project Sunroof. While these datasets provide rich
% nation-wide data, for this module, you will specficially analyze the
% state of California. 

% Learning objectives:
%   1. Learning how to apply non-linear regression techniques.
%       - Polynomial Regression
%       - Local Regression
%   2. Recognizing advantages and disadvantages of the different non-linear
%   regression techniques, with particular emphasis on handling outliers
%   and leverage points.
%   3. Introducing uncertainty methods, specifically bootstrapping.
%   4. Learning how to justify your choices regarding which data science
%   techniques to use.
%   5. Learning how to draw justifiable conclusions based on your analysis
%   and communicate limitations of the analysis.

%% 1. Data Preparation
% Please refer to the article, "Disparities in Rooftop Solar Deployment in
% the United States by Race and Ethnicity" by Sunter, Kammen and
% Castellanos or details on these data cleaning and preparation steps.

%% 1.1 USER INPUTS ------------------------------------------------------

warning off    % suppress warning messages

% ------------------ Majority Level ------------------

% The majority level sets the percentage of the census tract population 
% that must self-identify as the same race/ethnicity in order for the 
% census tract to be classified as that race/ethnicity. We had defined 
% majority as 50% and strong-majority as 75%.

majority_level = 0.5;

% ------------------ Variable of Interest ------------------

% For the LOWESS analysis, we explore racial disparity in rooftop PV 
% deployment as a function of median household income and the percentage of
% households occupied by renters. If you would like to generate plots with 
% the median household income along the x-axis (similar to Figures 2, 5, 
% S1, and S5), use 'median_income' as your variable of interest. If you 
% would like to generate plots with the percentage of households occupied 
% by renters (similar to Figure 3), use 'rental_ratio' as your variable of 
% interest. 

variable_of_interest='median_income';

% Exclude Census Tracts Without Rooftop PV Installations
% To explore the potential issue of 'seeding', we excluded census tracts 
% without rooftop PV installations to create Figures 5 and S5. If you would
% like to reproduce these figures and exclude census tracts without rooftop
% PV use true(1); otherwise, use false(1). Using faalse(1) will include all
% census tracts in the analysis and allow you to reproduce Figures 2, 3, 
% and S1.

exclude_census_tracts_without_rooftop_PV = false(1);

%% 1.2 LOAD DATA ------------------------------------------------------

% Updated data can be found at these sources:
% https://www.google.com/get/sunroof/data-explorer/
% https://www.census.gov/data.html

% The data provided on GitHub is the data used for the publication in 
% Nature Sustainability. We merged data from these two sources by matching 
% census tracts to create this file.

data= readtable('CensusSunroofMerged.csv');

%% 1.3 CLEAN DATA ------------------------------------------------------

% Remove census tracts where Google Project Sunroof analyzed < 95% of all 
% buildings in the census tract

data = data((data.percent_covered >= 95),:);

% Remove census tracts where there is no potential to install rooftop PV

data = data((data.count_qualified ~= 0),:);

% Remove census tracts with median household income below the 2013 poverty 
% threshold for a 4-person household 
% https://www.census.gov/data/tables/time-series/demo/income-poverty/historical-poverty-thresholds.html

data = data(data.Med_HHD_Inc_ACS_09_13 >= 23834,:);
data.var1 = (1:1:length(data.Med_HHD_Inc_ACS_09_13))';

% If the user input a request to remove census tracts without any rooftop 
% solar from the analysis, remove these tracts

if exclude_census_tracts_without_rooftop_PV == true(1)
    data = data(data.existing_installs_count ~= 0,:);
end 
    
%% 1.4 CALCULATE STATE NORMALIZED SOLAR DEPLOYMENT

% Equation 1 in the Nature Sustainability analysis
% Compute the percentage of buildings with existing rooftop PV relative to 
% the total number of buildings with roofs that qualify to support PV based
% on the algorithm and criteria to identify appropriate potential rooftop 
% space for PV deployment set forth by Google Project Sunroof. This is the 
% solar deployment rate.

data.current_installs_relative_to_total_installs = data.existing_installs_count./data.count_qualified.*100;

% Equation 2 in the Nature Sustainability analysis
% Normalize the solar deployment rate by the average solar deployment rate 
% in each state. This mitigates the effects of variations across states, 
% such as available solar resources, incentive programs and policies, and 
% electricity prices.
[States,idx]=unique(data.state_name);
df_state_mean = zeros(length(data.state_name),1);

for Num = 1:size(unique(data.state_name))
    idx_state = find(strcmp(data.state_name, States(Num)));
    mean_state = mean(data.current_installs_relative_to_total_installs(idx_state));
    df_state_mean(idx_state) = mean_state;
end

data.state_mean_existing_installation_relative_to_potential = df_state_mean;
data.normalized_existing_installation = data.current_installs_relative_to_total_installs./data.state_mean_existing_installation_relative_to_potential;

%% 1.5 SELECT CALIFORNIAN CENSUS TRACTS FOR ANALYSIS

% Some of the algorithms take quite some time to run when there are many 
% data points being considered. For this Data Lab you will focus your study
% on the state of California. This will serve as a comparison to the 
% analysis that was done at the national level (Disparities in Rooftop 
% Solar Deployment in the United States by Race and Ethnicity by Sunter, 
% et al.).
% data=readtable('CensusSunroofMerged.csv');

data = data(strcmp(data.state_name ,'New York'),:);
data.Var1 =  (1:1:length(data.state_name))';


%% 1.6 GROUP CENSUS TRACTS BY THEIR MAJORITY RACE/ETHNICITY
% Create matrices for each race/ethnicity in the study

AsianMajorityIndex = find (data.pct_NH_Asian_alone_ACS_09_13 >= 50 );
AsianMajority = data(AsianMajorityIndex, :);

BlackMajorityIndex = find (data.pct_NH_Blk_alone_ACS_09_13 >= 50 );
BlackMajority = data(BlackMajorityIndex, :);

HispanicMajorityIndex = find (data.pct_Hispanic_ACS_09_13 >= 50 );
HispanicMajority = data(HispanicMajorityIndex, :);

WhiteMajorityIndex = find (data.pct_NH_White_alone_ACS_09_13 >= 50 );
WhiteMajority = data(WhiteMajorityIndex, :);

NoMajorityIndex = find( ( data.pct_NH_Asian_alone_ACS_09_13 < 50 ) & ...
                          ( data.pct_NH_Blk_alone_ACS_09_13 < 50 ) & ...
                          ( data.pct_Hispanic_ACS_09_13 < 50 ) & ...
                          ( data.pct_NH_White_alone_ACS_09_13 < 50 ) );
NoMajority = data(NoMajorityIndex, :);

AsianMajority = sortrows(AsianMajority, 'Med_HHD_Inc_ACS_09_13');
BlackMajority = sortrows(BlackMajority, 'Med_HHD_Inc_ACS_09_13');
HispanicMajority = sortrows(HispanicMajority, 'Med_HHD_Inc_ACS_09_13');
WhiteMajority = sortrows(WhiteMajority, 'Med_HHD_Inc_ACS_09_13');
NoMajority = sortrows(NoMajority, 'Med_HHD_Inc_ACS_09_13');




% Exercise 1: You have grouped California census tracts by racial/ethnic
% majority based on self-reporting in the American Community Survey. A
% dataframe is a table. For this module, dataframes are created for each
% racial/ethnic majority with dataframe names beginning with df_. Each row
% in this datagrame is a census tract. The matlab function length() provides
% the length of the data, which for this module is the number of
% census tracts in that data. For example, length(df_asian) will give the
% number of census tracts in California that 50% or more of the population
% self-identified as Asian. (a) How many census tracts are in each
% racial/ethnic majority group? Fill in the ellipsis in the cell below. (b)
% Are your results concerning? Why or why not?

numAsian = length(AsianMajorityIndex)
numBlack = length(BlackMajorityIndex)
numHispanic = length(HispanicMajorityIndex)
numWhite = length(WhiteMajorityIndex)
numNoMajority = length(NoMajorityIndex)



% Fill in the comments to complete part (a) and then remove the %
disp(['Number of Asian-majority census tracts:', num2str(numAsian)])
disp(['Number of Black-majority census tracts:', num2str(numBlack)]) 
disp(['Number of Hispanic-majority census tracts:', num2str(numHispanic) ]) 
disp(['Number of White-majority census tracts:',  num2str(numWhite) ]) 
disp(['Number of No-majority (diverse) census tracts:',  num2str(numNoMajority) ] )

%%%%

%yBlack = BlackMajority.normalized_existing_installation;
%xBlack = BlackMajority.Med_HHD_Inc_ACS_09_13;
%plot(xBlack, yBlack, '.')
%title('Black Majority Census Tracts in Indiana')
%xlabel('Existing Installation')
%ylabel('Median Household Income')


yWhite = WhiteMajority.normalized_existing_installation;
xWhite = WhiteMajority.Med_HHD_Inc_ACS_09_13;
plot(xWhite, yWhite, '.')
title('White Majority Census Tracts in New York')
xlabel('Existing Installation')
ylabel('Median Household Income')

%semilogx --- something to try
%% make a table for the whole country

NumberofCensusTracts = [numAsian; numBlack; numHispanic; numWhite; numNoMajority]
%I sorted and looked through the median incomes for each ethnic majority to
%find these numbers
MinMedianIncome = [23897; 23836; 23838; 23836; 23849] 
MaxMedianIncome = [206429; 184167; 250001; 250001; 204188]

table(NumberofCensusTracts,MinMedianIncome,MaxMedianIncome, ...
    'VariableNames', {'Number of Census Tracts' 'Minimum Median Income' 'Maximum Median Income'}, ...
    'RowNames', {'Asian Majority' 'Black Majority' 'Hispanic Majority' 'White Majority' 'No Majority'})
