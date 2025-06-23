function tvec = SetupTimeVector(npoints,Fs)
% function tvec = SetupTimeVector(npoints,Fs)
% returns a vector 'tvec' of times in seconds,
% of length npoints, starting at t=0 and 
% spaced apart by 1/Fs seconds


% Campbell Braun
if npoints <= 0 && Fs <= 0
    tvec = [];
    return
end

dT = 1/Fs;

tvec = zeros(1, npoints);

for i=1:npoints
    tvec(i) = (i-1)*dT;
    % usiing i-1 because we start from t=0 in increments of dT
end
