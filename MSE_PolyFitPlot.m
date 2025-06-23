function MSE = MSE_PolyFitPlot(X, Y, poly_order)

Xfit = linspace(min(X), max(X), 1000);

p = polyfit(X, Y, poly_order);
Yfit = polyval(p,Xfit);
Yhat = polyval(p,X);

figure

hold on
plot(X, Y,'o');
plot(Xfit, Yfit, 'LineWidth', 3)


MSE = immse( Y , Yhat );
disp(['MSE:', num2str(MSE)])

        
end