%PlotPowerUsage

load('powerDataset.mat');

%desiredTime = [15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 180]
%C = []

%for i=1:length(desiredTime)
   % C(i) = LinearInterp(desiredTime(i), timeMinutes, powerWatts)
%end

%plot(desiredTime, C)

subplot 211
plot(timeMinutes, powerWatts, '*-');
xlabel('Measured Time (Minutes)');
ylabel('Measured Power (Watts)');

C(1) = 0;
for i = 15:180
   C(i) = LinearInterp(i, timeMinutes, powerWatts);
end

subplot 212
plot(1:length(C),C, '*-');
xlabel('Time (minutes)');
ylabel('Linear Interpolated Power (Watts)');

%The interpolated data points make sense for the most part because they
%follow the same general pattern as the original measured power values.
%However, for the values of x from 1-13, the interpolated data points do
%not make sense. The interpolated data shows a y value of 0 for all of
%these points, which is dramatically different than the rest of the
%interpolation & wrong.

%If I am only reporting the interpolated data points, I am missing the
%clear and dramatic differences between the original data points. With
%these interpolated data points, everything is bunched together and the
%distinctness of the original data points is lost. Not to mention the
%innacuracies of the y values for the x values from 1-13, which I touched
%on earlier. 

%Overall, the interpolated data captures the essence of the original data
%pretty well. It works as a good summary. If you had a lot more original
%data points, I think linear interpolation would be a great way to
%summarize them and show a figure that made it easier to visualize the
%data. 
