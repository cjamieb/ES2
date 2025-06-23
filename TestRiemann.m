%TestRiemann

result = IntegrationRiemann(SampledSine (1, 1, 0.01, 0.5),0.01)
%I wrote the code for the plot in the function itself

result2 = IntegrationRiemann(SampledSine (1, 1, 0.01, 0.49),0.01)


deltaT = .000005;
relative_error = abs(((1/pi) -  IntegrationRiemann(SampledSine(1, 1, deltaT, .5 - deltaT), deltaT))/(1/pi))


%ANSWERS:

%The relative error between the exact and approximate values for the
%integration using dT = 0.01 &  T = 0.5 - dT is 2.5 x 10^55. We need to use
%T=0.5-dT because if we don't, then everything ends one iteration before it
%should.

%To get the relative error < 10^-8, you need a dT value of 0.000005

%To calculate the right-hand Riemann sum instead of the left hand one, I
%would change the line "for i=1:length(f)- 1" in IntegrationRiemann to
%"i=2:length(f)" because we should now consider the last
%index and not start at the first index.
