%main_energy_inclass
clear, clc
format short

%read in country table
country = readtable('CountryValues.csv')

%ENERGY
%create model table
Tot_Energy_Demand = country.Population .* country.Energy_Demand_Coeff;
model = table(Tot_Energy_Demand);

%test with existing renewable percentages
model.Pct_Energy_fr_Renew = [0.15; 0.25];
model = calcModelEnergy(country, model);

%FOOD
model.Tot_Food_Demand = country.Population .* country.Food_Demand_Coeff;
model.Pct_Food_fr_Renew = [0.5; 0.1];

model = calcModelFood(country, model);

%calculate the total water needs
model.Water_Reqd_Ind_Res = country.Population .* country.WRC_Industry_Resid;
model.Water_Reqd_Tot = model.Water_Reqd_Ind_Res + model.Water_Reqd_Energy + model.Water_Reqd_Food

model.WSI = model.Water_Reqd_Tot ./ country.Water_Into_Region;

%FF_emissions = model.FF_Emissions

%WSI = model.WSI

%total_cost = model.Cost_Energy_Tot + model.Cost_Food_Tot

pcts_food = 0:.01:1;
pcts_energy = 0:.01:1;

WSI = zeros(length(pcts),length(pcts));
tot_cost = WSI;
emissions = WSI;

em_lim = 12e6;
WSI_lim = 0.33;

for j = 1:length(pcts_food)
    for i = 1:length(pcts_energy)
        
        model.Pct_Energy_fr_Renew(2) = pcts_energy(i);
        model.Pct_Food_fr_Renew(2) = pcts_food(j);
        
        model = calcModelEnergy(country, model);
        model = calcModelFood(country, model);
        
        model.Water_Reqd_Tot = model.Water_Reqd_Ind_Res + model.Water_Reqd_Energy + model.Water_Reqd_Food;
    
        WSI(i,j) = model.Water_Reqd_Tot(2) ./ country.Water_Into_Region(2);
    
        tot_cost(i,j) = model.Cost_Energy_Tot(2) + model.Cost_Food_Tot(2);
    
        emissions(i,j) = model.FF_Emissions(2);
    
    end
end

cost_SDG2 = tot_cost(WSI<WSI_lim & emissions < em_lim)
[mincost, Imin] = min(cost_SDG2)

%plot
figure
surf(pcts_food,pcts_energy,WSI), shading flat, view([0 90]), colorbar
xlabel('% food renew'), ylabel('% energy renew'), title('WSI')

figure
surf(pcts_food,pcts_energy,emissions), shading flat, view([0 90]), colorbar
xlabel('% food renew'), ylabel('% energy renew'), title('emissions')

figure
surf(pcts_food,pcts_energy,tot_cost), shading flat, view([0 90]), colorbar
xlabel('% food renew'), ylabel('% energy renew'), title('cost')





%emissions for current: 4.97e7 for A, 5.82e& for B

