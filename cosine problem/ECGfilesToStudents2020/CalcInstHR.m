function instBPM = CalcInstHR(tvec,iPk)
% function instBPM = CalcInstHR(tvec,iPk)
% given a time vector tvec and list of indices for peaks,
% returns a vector instBPM with the instantaneous beats per minute



% Campbell Braun
instBPM(length(iPk)-1) = zeros;

for i = 1:length(iPk) - 1
    instBPM(i) = 60 ./(tvec(iPk(i+1)) - tvec(iPk(i)));
    %multiply by 60 to get minutes
end


