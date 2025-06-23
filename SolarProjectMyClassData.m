%mydata
clear, clc

x = linspace(0,20,100)
y = x.^3 + 4*x.^2 + 2 *x +9;

ynoise = y + 50*randn(size(x)).*x;

plot(x,y,'o',x,ynoise,'.')

MSE2 = MSE_PolyFitPlot(x, ynoise, 2)

MSE3 = MSE_PolyFitPlot(x, ynoise, 3)