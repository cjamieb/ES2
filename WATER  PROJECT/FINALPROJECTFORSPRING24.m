%CAMPBELL BRAUN FINAL ES2 PROJECT
clear, clc;

%data being used
healthyaging = readtable('Alzheimer_s_Disease_and_Healthy_Aging_Data.csv')
walkability = readtable('EPA_SmartLocationDatabase_V3_Jan_2021_Final.csv')


%====================================================================
%for healthyaging data


healthyagingindex = find(healthyaging.YearStart>=2019);
healthyaging2 = healthyaging(healthyagingindex, :);

%to remove unwanted columns

healthyaging2(:,"RowId") = [];
healthyaging2(:, "Data_Value_Footnote") = [];
healthyaging2(:, "Data_Value_Footnote_Symbol") = [];
healthyaging2(:, "Datasource") = [];

%making sure the data is from 2019, the same year the walkability data is
%from
yearindex = find(healthyaging2.YearStart==2019);
healthyaging2019 = healthyaging2(yearindex, :);

%making sure the data is only from Massachusetts
MAindex = find(healthyaging2019.LocationID==25);
healthyagingMA = healthyaging2019(MAindex, :);

%finding where the different categories of health data are
arthritisindex = find(healthyagingMA.Topic=="Arthritis among older adults");
obesityindex = find(healthyagingMA.Topic=="Obesity");
highbloodpressureindex = find(healthyagingMA.Topic=="High blood pressure ever");
mentaldistressindex = find(healthyagingMA.Topic=="Frequent mental distress");
lifetimedepressionindex = find(healthyagingMA.Topic=="Lifetime diagnosis of depression");

%making separate data tables for each category of health data
arthritisMA = healthyagingMA(arthritisindex, :);
obesityMA = healthyagingMA(obesityindex, :);
hbpMA = healthyagingMA(highbloodpressureindex, :);
mentaldistressMA = healthyagingMA(mentaldistressindex, :);
lifetimedepressionMA = healthyagingMA(lifetimedepressionindex, :);

%dividing these categories of data by age group 
arthritisfind65 = arthritisMA((find(arthritisMA.Stratification1=="65 years or older")), :);
arthritisfind65(2:3, :) = []
arthritisfindoverall = arthritisMA((find(arthritisMA.Stratification1=="Overall")), :);
arthritisfindoverall(2, :) = []
arthritisfind50 = arthritisMA((find(arthritisMA.Stratification1=="50-64 years")), :);
arthritisfind50(2, :) = []
arthritisfind50(4, :) = []


obesityfind65 = obesityMA((find(obesityMA.Stratification1=="65 years or older")), :);
obesityfind65(1:2, :) = []
obesityfindoverall = obesityMA((find(obesityMA.Stratification1=="Overall")), :);
obesityfindoverall(3, :) = []
obesityfindoverall(4, :) = []
obesityfind50 = obesityMA((find(obesityMA.Stratification1=="50-64 years")), :);
obesityfind50(1, :) = []
obesityfind50(5, :) = []


hbpfind65 = hbpMA((find(hbpMA.Stratification1=="65 years or older")), :);
hbpfind65(1, :) = []
hbpfind65(4, :) = []
hbpfindoverall = hbpMA((find(hbpMA.Stratification1=="Overall")), :);
hbpfindoverall(2, :) = []
hbpfind50 = hbpMA((find(hbpMA.Stratification1=="50-64 years")), :);
hbpfind50(4, :) = []


mentaldistressfind65 = mentaldistressMA((find(mentaldistressMA.Stratification1=="65 years or older")), :);
mentaldistressfind65(1, :) = []
mentaldistressfind65(1, :) = []
mentaldistressfind65(3:4, :) = []
mentaldistressfindoverall = mentaldistressMA((find(mentaldistressMA.Stratification1=="Overall")), :);
mentaldistressfindoverall(6:7, :) = []
mentaldistressfind50 = mentaldistressMA((find(mentaldistressMA.Stratification1=="50-64 years")), :);
mentaldistressfind50(1, :) = []
mentaldistressfind50(4, :) = []
mentaldistressfind50(5, :) = []

lifetimedepressionfind65 = lifetimedepressionMA((find(lifetimedepressionMA.Stratification1=="65 years or older")), :);
lifetimedepressionfind65(1, :) = []
lifetimedepressionfind65(1, :) = []
lifetimedepressionfind65(3, :) = []
lifetimedepressionfindoverall = lifetimedepressionMA((find(lifetimedepressionMA.Stratification1=="Overall")), :);
lifetimedepressionfindoverall(1, :) = []
lifetimedepressionfindoverall(2, :) = []
lifetimedepressionfind50 = lifetimedepressionMA((find(lifetimedepressionMA.Stratification1=="50-64 years")), :);
lifetimedepressionfind50(4, :) = []
lifetimedepressionfind50(6, :) = []

StratficationCategories = ["65 years or older", "Overall", "50-64 years"];

%finding the mean health data value by category and age group
MeanArthritis = [(mean(arthritisfind65.Data_Value)), (mean(arthritisfindoverall.Data_Value)), (mean(arthritisfind50.Data_Value))];
MeanObesity = [(mean(obesityfind65.Data_Value)), (mean(obesityfindoverall.Data_Value)), (mean(obesityfind50.Data_Value))];
MeanHBP = [(mean(hbpfind65.Data_Value)), (mean(hbpfindoverall.Data_Value)), (mean(hbpfind50.Data_Value))];
MeanFluVax = [(mean(fluvaccinefind65.Data_Value)), (mean(fluvaccinefindoverall.Data_Value)), (mean(fluvaccinefind50.Data_Value))];
MeanMentalDistress = [(mean(mentaldistressfind65.Data_Value)), (mean(mentaldistressfindoverall.Data_Value)), (mean(mentaldistressfind50.Data_Value))];

%=====================================================================
%for the walkability data

%making sure the data is from Massachusetts
MAindex3 = find(walkability.STATEFP==25)
walkabilityMA = walkability(MAindex3, :)

%removing unwanted columns
walkabilityMA(:, "CBSA") = []
walkabilityMA(:, "CBSA_POP") = []
walkabilityMA(:, "CBSA_EMP") = []
walkabilityMA(:, "CBSA_WRK") = []
walkabilityMA(:, "Ac_Water") = []
walkabilityMA(:, "Ac_Land") = []
walkabilityMA(:, "Ac_Unpr") = []
walkabilityMA(:, "HH") = []
walkabilityMA(:, "P_WrkAge") = []
walkabilityMA(:, "TotEmp") = []
walkabilityMA(:, "E5_Ret") = []
walkabilityMA(:, "E5_Off") = []
walkabilityMA(:, "E5_Ind") = []
walkabilityMA(:, "E5_Svc") = []
walkabilityMA(:, "E5_Ent") = []
walkabilityMA(:, "E8_Ret") = []
walkabilityMA(:, "E8_off") = []
walkabilityMA(:, "E8_Ind") = []
walkabilityMA(:, "E8_Svc") = []
walkabilityMA(:, "E8_Ent") = []
walkabilityMA(:, "E8_Ed") = []
walkabilityMA(:, "E8_Hlth") = []
walkabilityMA(:, "E8_Pub") = []
walkabilityMA(:, "E_LowWageWk") = []
walkabilityMA(:, "R_LowWageWk") = []
walkabilityMA(:, "R_MedWageWk") = []
walkabilityMA(:, "R_HiWageWk") = []
walkabilityMA(:, "R_PCTLOWWAGE") = []
walkabilityMA(:, "E_MedWageWk") = []
walkabilityMA(:, "E_HiWageWk") = []
walkabilityMA(:, "E_PctLowWage") = []
walkabilityMA(:,21:83) = []
walkabilityMA(:, "Ac_Total") = []
walkabilityMA(:, 12:19) = []

%copying the data into a new walkability data set so I still have the
%original data somewhere
walkabilityMAfinal = walkabilityMA;


%Finding the rows of data the correspond to the various counties in MA

findbarnstable = find(walkabilityMAfinal.COUNTYFP==1); 
findberkshire = find(walkabilityMAfinal.COUNTYFP==3); 
findbristol = find(walkabilityMAfinal.COUNTYFP==5); 
finddukes = find(walkabilityMAfinal.COUNTYFP==7);
findessex = find(walkabilityMAfinal.COUNTYFP==9);
findfranklin = find(walkabilityMAfinal.COUNTYFP==11); 
findhampden = find(walkabilityMAfinal.COUNTYFP==13); 
findhampshire = find(walkabilityMAfinal.COUNTYFP==15);
findmiddlesex = find(walkabilityMAfinal.COUNTYFP==17); 
findnantucket = find(walkabilityMAfinal.COUNTYFP==19); 
findnorfolk = find(walkabilityMAfinal.COUNTYFP==21); 
findplymouth = find(walkabilityMAfinal.COUNTYFP==23); 
findsuffolk = find(walkabilityMAfinal.COUNTYFP==25); 
findworcester = find(walkabilityMAfinal.COUNTYFP==27); 
%(For example, if a row has the county FIPS code 1, then we know this data
%is from Barnstable County.)
%(The variable findbarnstable records the row number where this data lies.)


%removing data points that were not a number or seemed inconsistent with
%the county
findbarnstable(41:196, :) = [] %40
findberkshire(10:143, :) = [] %9
findbristol(15:390, :) = [] %14
findessex(24:546, :) = [] %23
findfranklin(12:62, :) = [] %11
findhampden(13:337, :) = [] %12
findhampshire(11:105, :) = [] %10
findmiddlesex(36:1133, :) = [] %35
findnantucket(4:12, :) = [] %3
findnorfolk(20:474, :) = [] %19
findplymouth(25:360, :) = [] %24
findsuffolk(5:646, :) = [] %4
findworcester(34:560, :) = [] %33
%(For example, if there are 3 towns in Nantucket County, it would not make
%sense to have 12 data points if each data point is supposed to be unique
%to their town.)

%removing data from Dukes county
walkabilityMAfinal(finddukes, :) = []
%Since Dukes county is comprised of many islands between martha's
%vineyard and gosnold, I felt it was strange to group it together as one
%place, so I removed this data.

%creating the final walkability dataset using the cleaned data
walkabilityMAfinal(findbarnstable, :) = walkabilityMA(findbarnstable, :)
walkabilityMAfinal(findberkshire, :) = walkabilityMA(findberkshire, :)
walkabilityMAfinal(findbristol, :) = walkabilityMA(findbristol, :)
walkabilityMAfinal(findessex, :) = walkabilityMA(findessex, :)
walkabilityMAfinal(findfranklin, :) = walkabilityMA(findfranklin, :)
walkabilityMAfinal(findhampden, :) = walkabilityMA(findhampden, :)
walkabilityMAfinal(findhampshire, :) = walkabilityMA(findhampshire, :)
walkabilityMAfinal(findmiddlesex, :) = walkabilityMA(findmiddlesex, :)
walkabilityMAfinal(findnantucket, :) = walkabilityMA(findnantucket, :)
walkabilityMAfinal(findnorfolk, :) = walkabilityMA(findnorfolk, :)
walkabilityMAfinal(findplymouth, :) = walkabilityMA(findplymouth, :)
walkabilityMAfinal(findsuffolk, :) = walkabilityMA(findsuffolk, :)
walkabilityMAfinal(findworcester, :) = walkabilityMA(findworcester, :)
walkabilityMAfinal(1: 4689, :) = []

%FOR WALKABILITY GEOPLOT

%Since there were no Latitude or Longitude points tied to the walkability
%dataset, I made an excel file with the coordinates of all the towns in MA,
%which I loaded into MATLAB here to use

MAcoordinates = readtable("MAcoordinates.xlsx")

%setting the color of the bubbles on the map to depend on walkability value
colordata = walkabilityMAfinal.NatWalkInd;
hold off

%categorizing walkability values
leastwalkable = find(walkabilityMAfinal.NatWalkInd <= 5.75);
belowaveragewalkable = find(walkabilityMAfinal.NatWalkInd > 5.75 & walkabilityMAfinal.NatWalkInd <= 10.5);
aboveaveragewalkable = find(walkabilityMAfinal.NatWalkInd > 10.5 & walkabilityMAfinal.NatWalkInd <= 15.25);
mostwalkable = find(walkabilityMAfinal.NatWalkInd > 15.25 & walkabilityMAfinal.NatWalkInd <= 20);

%Adding another column to the data to store which walkability category each data point
%falls into
walkabilityMAfinal.Category = zeros(275, 1)
walkabilityMAfinal.Category(leastwalkable, :) = 1
walkabilityMAfinal.Category(belowaveragewalkable, :) = 2
walkabilityMAfinal.Category(aboveaveragewalkable, :) = 3
walkabilityMAfinal.Category(mostwalkable, :) = 4

%Adding a Latitude column and a Longitude column to the data
%(Yes, we already have Latitude and Longitude from my MAcoordinates.xlsx
%file, but we need to have the correct corresponding coordinates to each walkability data
%point)
walkabilityMAfinal.Latitude = zeros(275, 1)
walkabilityMAfinal.Longitude = zeros(275, 1)

%finding the rows of MAcoordinates.xlsx where coordinates for towns in the
%specific MA counties lie
barnstableLL = find(MAcoordinates.County_1=="Barnstable"); 
berkshireLL = find(MAcoordinates.County_1=="Berkshire"); 
bristolLL = find(MAcoordinates.County_1=="Bristol"); 
essexLL = find(MAcoordinates.County_1=="Essex"); 
franklinLL = find(MAcoordinates.County_1=="Franklin"); 
hampdenLL = find(MAcoordinates.County_1=="Hampden"); 
hampshireLL = find(MAcoordinates.County_1=="Hampshire"); 
middlesexLL = find(MAcoordinates.County_1=="Middlesex"); 
nantucketLL = find(MAcoordinates.County_1=="Nantucket"); 
norfolkLL = find(MAcoordinates.County_1=="Norfolk"); 
plymouthLL = find(MAcoordinates.County_1=="Plymouth"); 
suffolkLL = find(MAcoordinates.County_1=="Suffolk"); 
worcesterLL = find(MAcoordinates.County_1=="Worcester"); 

%Inputting longitude into the walkability dataset based on where the
%county-specific data is and where the town-specific coordinates are in the
%Excel file of all the coordinates
walkabilityMAfinal.Longitude(findbarnstable, :) = MAcoordinates.Longitude(barnstableLL, :)
walkabilityMAfinal.Longitude(findberkshire, :) = MAcoordinates.Longitude(berkshireLL, :)
walkabilityMAfinal.Longitude(findbristol, :) = MAcoordinates.Longitude(bristolLL, :)
walkabilityMAfinal.Longitude(findessex, :) = MAcoordinates.Longitude(essexLL, :)
walkabilityMAfinal.Longitude(findhampden, :) = MAcoordinates.Longitude(hampdenLL, :)
walkabilityMAfinal.Longitude(findhampshire, :) = MAcoordinates.Longitude(hampshireLL, :)
walkabilityMAfinal.Longitude(findmiddlesex, :) = MAcoordinates.Longitude(middlesexLL, :)
walkabilityMAfinal.Longitude(findnantucket, :) = MAcoordinates.Longitude(nantucketLL, :)
walkabilityMAfinal.Longitude(findnorfolk, :) = MAcoordinates.Longitude(norfolkLL, :)
walkabilityMAfinal.Longitude(findplymouth, :) = MAcoordinates.Longitude(plymouthLL, :)
walkabilityMAfinal.Longitude(findsuffolk, :) = MAcoordinates.Longitude(suffolkLL, :)
walkabilityMAfinal.Longitude(findworcester, :) = MAcoordinates.Longitude(worcesterLL, :)
%(For example, with findbarnstable, we know where the barnstable county data is
%in the walkability data set. With barnstableLL, we know where the
%barnstable county coordinates are in MAcoordinates.xlsx. Therefore, 
%at every findbarnstable index, we input longitude using the barnstableLL
%indices.)

%Inputting latitude into the walkability dataset based on where the
%county-specific data is and where the town-specific coordinates are in the
%Excel file of all the coordinates
walkabilityMAfinal.Latitude(findbarnstable, :) = MAcoordinates.Latitude(barnstableLL, :)
walkabilityMAfinal.Latitude(findberkshire, :) = MAcoordinates.Latitude(berkshireLL, :)
walkabilityMAfinal.Latitude(findbristol, :) = MAcoordinates.Latitude(bristolLL, :)
walkabilityMAfinal.Latitude(findessex, :) = MAcoordinates.Latitude(essexLL, :)
walkabilityMAfinal.Latitude(findhampden, :) = MAcoordinates.Latitude(hampdenLL, :)
walkabilityMAfinal.Latitude(findhampshire, :) = MAcoordinates.Latitude(hampshireLL, :)
walkabilityMAfinal.Latitude(findmiddlesex, :) = MAcoordinates.Latitude(middlesexLL, :)
walkabilityMAfinal.Latitude(findnantucket, :) = MAcoordinates.Latitude(nantucketLL, :)
walkabilityMAfinal.Latitude(findnorfolk, :) = MAcoordinates.Latitude(norfolkLL, :)
walkabilityMAfinal.Latitude(findplymouth, :) = MAcoordinates.Latitude(plymouthLL, :)
walkabilityMAfinal.Latitude(findsuffolk, :) = MAcoordinates.Latitude(suffolkLL, :)
walkabilityMAfinal.Latitude(findworcester, :) = MAcoordinates.Latitude(worcesterLL, :)
%(For example, with findbarnstable, we know where the barnstable county data is
%in the walkability data set. With barnstableLL, we know where the
%barnstable county coordinates are in MAcoordinates.xlsx. Therefore, 
%at every findbarnstable index, we input latitude using the barnstableLL
%indices.)


walkabilityMAfinal(227:2077, :) = []

%When I went through the process of placing longitude and latitude points
%in the data set, MATLAB kept leaving cells of 0 in between sets of data
%points. I used techniques to find where the zeros were and delete them,
%but it was not working, so I simply deleted them in Excel and loaded the
%new coordinates via Excel into MATLAB. This way, I corrected the
%coordinate columns in the walkability data.

finalcoordinates = readtable("FINALCOORDINATES.xlsx")

walkabilityMAfinal.Latitude = finalcoordinates.Latitude
walkabilityMAfinal.Longitude = finalcoordinates.Longitude

lat = walkabilityMAfinal.Latitude;
lon = walkabilityMAfinal.Longitude;

%geoplotting these coordinates
MAshow = geobubble(lat,lon)
title("Walkability in Massachusetts");

%assigning each walkability category a color and legend based on the
%numerical values (1,2,3, or 4) that I assigned each data point in walkabilityMAfinal.Category
WalkabilityColor = discretize(walkabilityMAfinal.Category, [0 1 2 3 4], 'categorical', {'Least Walkable', 'Below Average Walkable', 'Above Average Walkable', 'Most Walkable'});
MAshow.ColorData = WalkabilityColor;


%FOR ARTHRITIS GEOPLOT
figure()
MAshowA = MAshow;

leastarthritis = find(arthritisMA.Data_Value <= 15);
belowaveragearthritis = find(arthritisMA.Data_Value > 10 & arthritisMA.Data_Value <= 35);
aboveaveragearthritis = find(arthritisMA.Data_Value > 30 & arthritisMA.Data_Value <= 52);
mostarthritis = find(arthritisMA.Data_Value > 50);

arthritisMA.Category = zeros(24, 1)
arthritisMA.Category(leastarthritis, :) = 1
arthritisMA.Category(belowaveragearthritis, :) = 2
arthritisMA.Category(aboveaveragearthritis, :) = 3
arthritisMA.Category(mostarthritis, :) = 4

colordata = arthritisMA.Data_Value;
MAshowA = geobubble(lat(43:66),lon(43:66))
title("Percentage of Residents with Arthritis in Select Massachusetts Towns")

ArthritisColor = discretize(arthritisMA.Category, [0 1 2 3 4], 'categorical', {'Least Arthritis (<14% of residents)', 'Below Average Arthritis (<34% of residents)', 'Above Average Arthritis (<51% of residents)', 'Most Arthritis (>51% of resdidents)'});
MAshowA.ColorData = ArthritisColor;

%FOR ARTHRITIS VERSUS WALKABILITY LINE PLOT
figure()
plot(sortrows(arthritisMA.Data_Value), walkabilityMAfinal.NatWalkInd(43:66))
title("Percent of Residents with Arthritis vs. Walkability in Select MA Towns")
xlabel("Residents with Arthritis (% of town population)")
ylabel("Walkability Score (based on the National Walkability Index)")


%FOR HIGH BLOOD PRESSURE GEOPLOT
figure()
MAshowHBP = MAshow;

leasthbp = find(hbpMA.Data_Value <= 15);
belowaveragehbp = find(hbpMA.Data_Value > 10 & hbpMA.Data_Value <= 35);
aboveaveragehbp = find(hbpMA.Data_Value > 30 & hbpMA.Data_Value <= 52);
mosthbp = find(hbpMA.Data_Value > 50);

hbpMA.Category = zeros(24, 1)
hbpMA.Category(leasthbp, :) = 1
hbpMA.Category(belowaveragehbp, :) = 2
hbpMA.Category(aboveaveragehbp, :) = 3
hbpMA.Category(mosthbp, :) = 4

colordata = hbpMA.Data_Value;
MAshowHBP = geobubble(lat(109:132),lon(109:132))
HBPColor = discretize(hbpMA.Category, [0 1 2 3 4], 'categorical', {'Least High Blood Pressure (<14% of residents)', 'Below Average High Blood Pressure (<34% of residents)', 'Above Average High Blood Pressure (<51% of residents)', 'Most High Blood Pressure (>51% of resdidents)'});
MAshowHBP.ColorData = HBPColor;
title("Percentage of Residents with High Blood Pressure in Select Massachusetts Towns")

%FOR HIGH BLOOD PRESSURE VERSUS WALKABILITY LINE PLOT
figure()
plot(sortrows(hbpMA.Data_Value), walkabilityMAfinal.NatWalkInd(109:132))
title("Percent of Residents with High Blood Pressure vs. Walkability in Select MA Towns")
xlabel("Residents with High Blood Pressure (% of town population)")
ylabel("Walkability Score (based on the National Walkability Index)")


%FOR LIFETIME DEPRESSION GEOPLOT
figure()
MAshowLD = MAshow;

leastdep = find(lifetimedepressionMA.Data_Value <= 15);
belowaveragedep = find(lifetimedepressionMA.Data_Value > 10 & lifetimedepressionMA.Data_Value <= 35);
aboveaveragedep = find(lifetimedepressionMA.Data_Value > 30 & lifetimedepressionMA.Data_Value <= 52);
mostdep = find(lifetimedepressionMA.Data_Value > 50);

lifetimedepressionMA.Category = zeros(24, 1)
lifetimedepressionMA.Category(leastdep, :) = 1
lifetimedepressionMA.Category(belowaveragedep, :) = 2
lifetimedepressionMA.Category(aboveaveragedep, :) = 3
lifetimedepressionMA.Category(mostdep, :) = 4

colordata = lifetimedepressionMA.Data_Value;
MAshowLD = geobubble(lat(156:179),lon(156:179))
LDColor = discretize(lifetimedepressionMA.Category, [0 1 2 3 4], 'categorical', {'Least Depression (<14% of residents)', 'Below Average Depression (<34% of residents)', 'Above Average Depression (<51% of residents)', 'Most Depression (>51% of resdidents)'});
MAshowLD.ColorData = LDColor;
title("Percentage of Residents with Depression in Select Massachusetts Towns")

%FOR LIFETIME DEPRESSION VERSUS WALKABILITY LINE PLOT
figure()
plot(sortrows(lifetimedepressionMA.Data_Value), walkabilityMAfinal.NatWalkInd(109:132))
title("Percent of Residents with Depression vs. Walkability in Select MA Towns")
xlabel("Residents with Depression (% of town population)")
ylabel("Walkability Score (based on the National Walkability Index)")


%FOR MENTAL DISTRESS GEOPLOT
figure()
MAshowMD = MAshow;

leastmentaldistress = find(mentaldistressMA.Data_Value <= 15);
belowaveragementaldistress = find(mentaldistressMA.Data_Value > 10 & mentaldistressMA.Data_Value <= 35);
aboveaveragementaldistress = find(mentaldistressMA.Data_Value > 30 & mentaldistressMA.Data_Value <= 52);
mostmentaldistress = find(mentaldistressMA.Data_Value > 50);

mentaldistressMA.Category = zeros(24, 1)
mentaldistressMA.Category(leastmentaldistress, :) = 1
mentaldistressMA.Category(belowaveragementaldistress, :) = 2
mentaldistressMA.Category(aboveaveragementaldistress, :) = 3
mentaldistressMA.Category(mostmentaldistress, :) = 4

colordata = mentaldistressMA.Data_Value;
MAshowMD = geobubble(lat(203:226),lon(203:226))
MDColor = discretize(mentaldistressMA.Category, [0 1 2 3 4], 'categorical', {'Least Mental Distress (<14% of residents)', 'Below Average Mental Distress (<34% of residents)', 'Above Average Mental Distress (<51% of residents)', 'Most Mental Distress (>51% of resdidents)'});
MAshowMD.ColorData = MDColor;
title("Percentage of Residents with Mental Distress in Select Massachusetts Towns")

%FOR MENTAL DISTRESS VERSUS WALKABILITY LINE PLOT
figure()
plot(sortrows(mentaldistressMA.Data_Value), walkabilityMAfinal.NatWalkInd(109:132))
title("Percent of Residents with Mental Distress vs. Walkability in Select MA Towns")
xlabel("Residents with Mental Distress (% of town population)")
ylabel("Walkability Score (based on the National Walkability Index)")


%FOR OBESITY GEOPLOT
figure()
MAshowO = MAshow;

leastobesity = find(obesityMA.Data_Value <= 15);
belowaverageobesity = find(obesityMA.Data_Value > 10 & obesityMA.Data_Value <= 35);
aboveaverageobesity = find(obesityMA.Data_Value > 30 & obesityMA.Data_Value <= 52);
mostobesity = find(obesityMA.Data_Value > 50);

obesityMA.Category = zeros(24, 1)
obesityMA.Category(leastobesity, :) = 1
obesityMA.Category(belowaverageobesity, :) = 2
obesityMA.Category(aboveaverageobesity, :) = 3
obesityMA.Category(mostobesity, :) = 4

colordata = obesityMA.Data_Value;
MAshowO = geobubble(lat(90:113),lon(90:113))
OColor = discretize(obesityMA.Category, [0 1 2 3 4], 'categorical', {'Least Obesity (<14% of residents)', 'Below Average Obesity (<34% of residents)', 'Above Average Obesity (<51% of residents)', 'Most Obesity (>51% of resdidents)'});
MAshowO.ColorData = OColor;
title("Percentage of Residents with Obesity in Select Massachusetts Towns")

%FOR HIGH BLOOD PRESSURE VERSUS WALKABILITY LINE PLOT
figure()
plot(sortrows(obesityMA.Data_Value), walkabilityMAfinal.NatWalkInd(90:113))
title("Percent of Residents with Obesity vs. Walkability in Select MA Towns")
xlabel("Residents with Obesity (% of town population)")
ylabel("Walkability Score (based on the National Walkability Index)")





