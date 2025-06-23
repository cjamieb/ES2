%MBTA Worksheet Day 2
clear, clc
N = 1000;

%Janitor's Trip: Bus
t1 = 5; %wait for bus
t2 = 18 + randn(N,1); %ride 96 bus to Harvard Square for about 19 mins (depending on traffic)
t3 = 17 + randn(N,1); %transfer buses (assuming you wait for about 18 minutes)
t4 = 10 + randn(N,1); %Ride 1 bus from Harvard Square to 84 Mass. Ave for about 11 mins (depending on traffic)
t5 = 2; %walk from 84 Mass. Ave to 77 Mass. Ave for about 2 mins (assuming you don't have to wait long to cross the street)
t_bus = t1+t2+t3+t4+t5;

tstdbus = std(t_bus)
trangebus = range(t_bus)

subplot 311
histogram(t_bus), title('Janitor''s Trip')


%Student's Trip: Subway
t6 = 22; %walk to Davis for the red line for about 22 mins (assuming you don't have to wait long to cross the street)
t7 = 9 + randn(N,1); %wait for the train for about 10 mins (assuming no major train delays)
t8 = 18 + randn(N,1); %Ride red line to Kendall/MIT stop for about 19 mins (assuming no major train delays)
t9 = 13; %walk to 77 Mass Ave for about 13 mins (assuming you don't have to wait long to cross the street)
t_subway = t6+t7+t8+t9;

tstdsubway = std(t_subway)
trangesubway = range(t_subway)

subplot 312
histogram(t_subway), title('Student''s Trip')


%Professor's Trip: Car
t10 = 10; %walk to car for about 10 mins (depending on traffic lights and parking location)
t11 = 22 + randn(N,1); %drive to MIT for about 23 mins (depending on traffic)
t12 = 3 + randn(N,1); %park for about 4 mins (depending on parking availability)
t13 = 7; %walk to 77 Mass Ave for about 7 mins (assuming you don't have to wait long to cross the street)
t_car = t10+t11+t12+t13;

tstdcar = std(t_car)
trangecar = range(t_car)

subplot 313
histogram(t_car), title('Professor''s Trip')

