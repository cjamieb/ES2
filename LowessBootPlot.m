function meanloess = LowessBootPlot(X,Y,span,plotcolor)


if ~iscolumn(X)
    X = X';
end

if ~iscolumn(Y)
    Y = Y';
end

% X= xBlack;
% Y = yBlack;
% span = 0.4; plotcolor = 'red';

f = @(xy) mylowess(xy,X,span);
yboot2 = bootstrp(1000,f,[X,Y])';
meanloess = mean(yboot2,2);

% stdloess = std(yboot2,0,2);
% CI_high = meanloess+2*stdloess;
% CI_low = meanloess-2*stdloess;

CI_high = prctile(yboot2,97.5,2);
CI_low = prctile(yboot2,2.5,2);

figure
hold on
semilogx(X,Y,'ko');
semilogx(X, meanloess,plotcolor,'linewidth',2);

x_plot =[X; flipud(X)];
y_plot=[CI_low; flipud(CI_high)];

fill(x_plot, y_plot, 1,'facecolor', plotcolor, 'edgecolor', 'none', 'facealpha', 0.4);
snapnow

% to draw lines instead of filled in area
% h2 = line(X, CI_high,'color','r','linestyle','--','linewidth',2);
% h3 = line(X, CI_low,'color','r','linestyle','--','linewidth',2);