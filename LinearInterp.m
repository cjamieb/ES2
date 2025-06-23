function y = LinearInterp(x, xTabulated, yTabulated)


%for i = 1:length(xTabulated)
   % if xTabulated(length(xTabulated)) < x
      %  y = -99
   % end
   % if xTabulated(i) == x
       % y1 = yTabulated(i-1);
       % x1 = xTabulated(i-1);
       % y2 = yTabulated(i+1);
       % x2 = xTabulated(i+1);
        
   % end
   
    
%end

y1 = 0;
y2 = 0;
x1 = 0;
x2 = 0;

if ( x < xTabulated(1) ) || ( x > xTabulated(end) )
    y = -99;
end

for i = 2:length(xTabulated)
    if (xTabulated(i - 1) <= x) && (x <= xTabulated(i)) 
        
        y1 = yTabulated(i-1);
        y2 = yTabulated(i);
        x1 = xTabulated(i-1);
        x2 = xTabulated(i);
     
    end

    % calculate y using ybefore, yafter, xbefore, xafter
    y = y1 + (x-x1)*((y2 - y1)/(x2 - x1))
end






