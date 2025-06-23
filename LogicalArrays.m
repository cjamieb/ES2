%x = [1 3 4];

%xrot = x([2:end, 1])

%isZero = (x==0)

%howmanyzeros = sum(x==0)

%--------------------------
%x = [1, -3, 4, 17, 1]
%y = (x==1)
%z = (x<5)
%v = (x>2 & x<=15)

%w = y&z
%u = y|z

%y && z
%--------------------------

%a=3
%b=4
%c=5

%ispythag = (a^2 + b^2 == c^2)

%1 = true, 0=false

%------------------------------
%multiply any data pt bigger than 1 by -1
%x(x>1) = -1*x(x>1)
%-------------------------------
%N=99;
%x = rand(1,N);
%y = zeros(1,N);

%x(x>0.5) = -2*x(y)

%y (x<=.5) = x(x<=.5) - .5
%-------------------------------

%3 headways for 4 arrival times

%assume buses are supposed to arrive every 10 min

%teven = 0:10:120;
%trand = teven + (rand(size(teven)) - 0.5).*10; %adds noise, <=+/- 10 min

%tevenheadways = teven(2:end) - teven(1:end-1)

%trandheadways = trand(2:end) - trand(1:end-1)

%busperhour_frequency = sum(teven(1:6)) + sum(teven(7:12))

%tevenfrequency = mean(1./tevenheadways.*60)
%trandfrequency = mean(1./trandheadways.*60)
%---------------------------------
% a = any()       %are any of them _____?
% b = all()       %are all of them _____?
%----------------------------------

a = [2 3 4]
any(2 == [2 3 4]^2)







