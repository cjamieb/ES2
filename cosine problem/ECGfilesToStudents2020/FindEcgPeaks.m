function iPeaks = FindEcgPeaks(ecg,threshold)
% function iPeaks = FindEcgPeaks(ecg,threshold);
% find samples in input vector 'ecg' that are peaks,
% and are above the value 'threshold'

% Campbell Braun
iPeaks = []

for b=round(ecg(2)):(length(ecg) - 1)
    if round(ecg(b)) > round(ecg(b -1)) && round(ecg(b)) > round(ecg(b + 1))
        if round(ecg(b)) > threshold
            iPeaks(end+1) = b
        end
    elseif round(ecg(1)) > round(ecg(2)) && round(ecg(1)) > threshold
        iPeaks(end+1) = 1
    elseif round(ecg(length(ecg))) > round(ecg(length(ecg) - 1)) && round(ecg(length(ecg))) > threshold
        iPeaks(end+1) = length(ecg)
    end
end