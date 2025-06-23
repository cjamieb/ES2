
function [y, t] = SampledSine (amp, freq, dT, maxTime)

if dT > 0 && maxTime > 0 && dT < maxTime
    t = 0:dT:maxTime;
    y = amp*sin(2*pi*freq*t);
else
    y = [];
end


%if (dT > 0 && maxTime > 0  && dT < maxTime)
   % for t = 0:dT:maxTime
     %    y(round(t/dT)+1) = amp * sin(2*pi*freq*t);
   % end
%else
    %y = [];
    %return
%end

%if (dT < 0 || maxTime < 0  || dT > maxTime)
    %y = [];
   % return
%else
   % for t = 0:dT:maxTime
       %  y(round(t/dT)+1) = amp * sin(2*pi*freq*t);
   % end
%end

