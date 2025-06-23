% randwalk_2d
clear; clc; clf

N=50;

xpos(1)= 0;
ypos(1)= 0;

for i = 2:N
    wlkx = sign(rand(1) - 0.5);
    wlky = sign(rand(1) - 0.5);
    
    xpos(i) = xpos(i-1) + wlkx;
    ypos(i) = ypos(i-1) + wlky;
end

plot(xpos,ypos,'x-')
xlabel('x position'), ylabel('y position')
axis equal