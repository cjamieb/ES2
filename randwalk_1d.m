% randwalk_1d

clear; clc; clf

N= 50;

pos(1)= 0;
for i = 2:N
    wlk= sign(rand(1) - 0.5);
    pos(i) = pos(i-1) + wlk;
end

plot(pos,1:N,'x-')
xlabel('position'), ylabel('iteration')


