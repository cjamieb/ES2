function [CI_high , CI_low] = PolyBootstrapPlot(x,y,porder,plotcolor)

% x = xBlack;       % use these to test
% y = yBlack;
% porder = 3;
% plotcolor = 'red';

N = length(x);

[x,Isort] = sort(x);
y = y(Isort);

% Number of bootstrap samples
NBOOT = 5000;

% Fit and plot of original data
p = polyfit(x,y,porder);
Pv = polyval(p,x);

figure
hold on
semilogx(x,y,'ko');
semilogx(x,Pv,plotcolor,'linewidth',2);

% Generate NBOOT resamplings of the x-y pairs
resampled_index = randi(N,N,NBOOT);
resampled_x = x(resampled_index);
resampled_y = y(resampled_index);

% Pre-allocate memory for the resampled fit values
p_boot  = zeros(NBOOT,porder+1);
Pv_boot = zeros(N,NBOOT);

% Fit each instance of the resampled data
for nb = 1:NBOOT
    p_boot(nb,:) = polyfit(resampled_x(:,nb),resampled_y(:,nb),porder);
    % Pv_boot(:,nb) = polyval(p_boot(nb,:),sort(resampled_x(:,nb)));
    Pv_boot(:,nb) = polyval(p_boot(nb,:),x);
end

% percentiles come from Pv_boot

CI_high = prctile(Pv_boot,97.5,2);
CI_low = prctile(Pv_boot,2.5,2);

x_plot =[x; flipud(x)];
y_plot=[CI_low; flipud(CI_high)];

fill(x_plot, y_plot, 1,'facecolor', plotcolor, 'edgecolor', 'none', 'facealpha', 0.4);