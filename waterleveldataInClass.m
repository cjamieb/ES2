load waterleveldata

indexbefore = [0]
indexafter = [0]

for i=1:length(waterlevel)
    if waterlevel(i) < 0 && waterlevel(i+1)>0
        k = k+1
        izero(k) = i;
    end
end

tzero = time(izero);

T = diff(tzero);
Tmean = mean(T)

plot(time, waterlevel, 'b-*', time(izero), waterlevel)
