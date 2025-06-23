%main_energy_inclass
clear, clc
format short

%read in country table
country = readtable('CountryValues.csv')

%create model table
Tot_Energy_Demand = country.Population .* country.Energy_Demand_Coeff;
model = table(Tot_Energy_Demand);

%calculate with existing renewable percentages
model.Pct_Energy_fr_Renew = [0.5; 0.25];
model = calcModelEnergy(country, model)

%emissions for current: 4.97e7 for A, 5.82e& for B
%WSI = Water Used/ Water Available

%calculate for range of percent renewable energy
pcts = 0:.01:1;

WSI = zeros(length(pcts),length(pcts));
tot_cost = WSI;
emissions = WSI;

em_lim = 29e6;
WSI_lim = 0.105;

k = 1;

for i = 1:length(pcts)

    model.Pct_Energy_fr_Renew(2) = pcts(i);
    
    model = calcModelEnergy(country, model);
    
    %WSI
    WSI(i) = model.Water_Reqd_Energy(2) ./ country.Water_Into_Region(2);
    tot_cost(i) = model.Cost_Energy_Tot(2);
    emissions(i) = model.FF_Emissions(2);

    if WSI(i) < WSI_lim && emissions(i) < em_lim
        cost_SDG(k) = tot_cost(i);
        pct_SDG(k) = pcts(i);
        k = k+1;

    end

end

min(cost_SDG)
min(pct_SDG)

%cost_SDG2 = tot_cost(WSI < WSI_lim & emissions < em_lim);
%pct_SDG2 = pcts(WSI < WSI_lim & emissions < em_lim)
%[mincost, Imin] = min(cost_SDG2);
%pct_min = pct_SDG2(Imin)


%plot
subplot 311
plot(pcts, tot_cost)
title('cost'), xlabel('% renew')

subplot 312
plot(pcts,WSI)
title('WSI'), xlabel('%renew')

subplot 313
plot(pcts, emissions)
title('emissions'), xlabel('%renew')


