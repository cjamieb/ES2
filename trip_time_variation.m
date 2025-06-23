%trip_time histograms
clear, clc
N = 1000;

%rand -uniform distribution
% randn -normal ditribution

%y1 = rand(1000,1)
%y2 = 9.5 + rand(1000,1)
%y3 = 9.5 + 3*rand(1000,1)


%subplot 311
%histogram(y1)
%subplot 312
%histogram(y2)
%subplot 313
%histogram(y3)

%x = randn(100,1)

%figure(2)
%histogram(x)

y1 = randn(N,1)
y2 = 10 + randn(N,1)
y3 = 10 + 2*randn(N,1)

subplot 311
histogram(y1)
subplot 312
histogram(y2)
subplot 313
histogram(y3)

%logan trip
%drive: google says 12-18
t_drive = 15+randn(N,1);
figure
ax1 = subplot(2,1,1);
histogram(t_drive), title ('driving')

xlim([0,80])

%transit: green - blue - 88 -- google 54 min
t1 = 4; %walk
t2 = 10 + randn(N,1) %waiting for train
t3 = 19.5 + 2*rand(N,1); %green line, est 20 min
t4 = 1 + 10 + randn(N,1); %transfer - walk + wait for BL
t5 = 12 + randn(N,1); %blue line, 9 min
t6 = 1 + 10 + randn(N,1); %walk + shuttle - 7 min

t_transit = t1+t2+t3+t4+t5+t6

tstd = std(t_transit)
trange = range(t_transit)

subplot 212
histogram(t_transit), title('transit')
xlim([0,80])


