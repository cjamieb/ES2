function outStr = CalcStats(instBPM)
% function outStr = CalcStats(instBPM)
% computes statistics (mean, median, std dev)
% and defines output string

% NOTE: THIS CODE IS COMPLETED. BUT MAKE SURE YOU UNDERSTAND IT!

avg = mean(instBPM);
med = median(instBPM);
stdev = std(instBPM);

outStr = sprintf('Heartrate, BPM: mean %0.0f, median %0.0f, stdev %0.1f',...
                 avg,med,stdev);

