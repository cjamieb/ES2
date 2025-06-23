
[y1, t1] = SampledSine (10, 0.2, 0.1, 5)
[y2, t2] = SampledSine (10, 1, 0.1, 5)
[y3, t3] = SampledSine (10, 2.5, 0.1, 5)
[y4, t4] = SampledSine (10, 4.5, 0.1, 5)

plot(t1,y1,t2,y2,t3,y3,t4,y4)
xlabel('Time (s)')
ylabel('Height')
legend('f = 0.2', 'f = 1', 'f = 2.5', 'f = 4.5')
title('ADC Output for Varying Frequencies'); 

%The periods for the 4 frequencies are 5, 1, 0.4, and about 0.222.

%In the plots, what's happening is the period is changing based on the
%frequency. The lower the frequency, the longer the wavelength is. For
%f=0.2, the height reaches one absolute maximum value and one absolute minimum
%value. However, for f=1, it is clear the height reaches several minimum
%and maxmum values. The same is the case for f=2.5 and f=4.5. 

%In order to make the plot with the 4.5 Hz look "right," you need a dT of
%0.1.



