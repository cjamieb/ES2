
clear, clc;

total = 0;

%for i=1:10
    %a = 1/i;
    %total = total + a;
%end

%vector math
for n = 10
    A = 1./(1:10);
end

S = sum(A);

disp("total = " + S)