load djiaData

%print(day);

%days below 16000
lowdjia = djia< 16000;

x = [djia]
ilow = find(x<16000)

dayslow = day(lowdjia)
dayslow2 = day(ilow)

dayslow3 = day(djia<16000)

%first and last day below 1600

day1 = dayslow(1)
daylast = dayslow3(end)

%fraction of the month above 1600

count = 0
for i=1:19
    if djia(i) >= 16000
        count = count + 1;
    end
end
AtOrAboveFraction = (count/19)

frachigh = (length(day) - length(dayslow)) /length(day)
