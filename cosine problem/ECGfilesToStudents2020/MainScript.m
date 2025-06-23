% MainScript
% calls the other functions, and plots results
% put answers to questions in this file!
clear, clc

% read in the data
load('ecgClean')
load('ecgMotionArtifact')

% set up time vector
tvec = SetupTimeVector(9001,2);

% find samples for all the peaks
ecg = ecgData
iPeaks = FindEcgPeaks(ecg,1050)

% find instantanous HR
iPk = [2,4,8,10,15,30,60,70,85, 200, 400, 800, 900, 230]
instBPM = CalcInstHR(tvec,iPk)

% find stats and set up output string
outStr = CalcStats(instBPM)

% plot the data, with peaks overlaid
subplot 211
plot(tvec, ecgData)
hold on
plot(ecg(iPeaks), 'ro')
title(num2str(outStr))
xlabel('Time (sec)')
ylabel('ECG signal (A/D units)')

subplot 212
plot(instBPM, 's:')
title(num2str(outStr))
xlabel('Time (sec)')
ylabel('ECG signal (A/D units)')

% set up output filename, and save jpeg file
saveas(gcf, 'ECGProject', 'jpeg')


%ANSWERS TO QUESTIONS!!

%1: It takes a lot longer to run because the small threshold causes there
%to be more significant peaks. The mean HR is 16 and the median HR is 8.

%2: All of my instantaneous rates seem believable. The mean and median HR do not change. The median seems to be the more
%accurate measurement because there is a standard deviation of 21.6.

%3: Higher threshold values should give you a more accurate mean HRs
%because there should be a lower standard deviation.

%4: These kinds of movements can make our calculations inaccurate. Mean HR
%is 16 and median is 8, but I think mean is more accurate.

%5: I believe a reasonable threshold would be something around the 1000s
%because it seems to be reasonable here, so this feels like a good range.
