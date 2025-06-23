%PlotScanData
%Campbell Braun, Homework 6

output = SimScanner(100, 80, 0.05, 2)

figure
surf(output)
colormap('spring')
colorbar
ylabel('distance from scanner to wall (m)'), xlabel('travel time (msec)')
title('Simulated Ultrasonic Range-Finder Raster Scan')

figure
imagesc(output)
colormap('spring')
colorbar
ylabel('distance from scanner to wall (m)'), xlabel('travel time (msec)')
title('Simulated Ultrasonic Range-Finder Raster Scan')