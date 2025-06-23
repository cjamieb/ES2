% CosApproxConverge_test
% calls CosApproxConverge
% cosx = CosApproxConverge(x, epsThreshold)
% HW3, problem 1 part 3
clear, clc

x= 4*pi;
epsThreshold = .001;    % 0.001 in problem

cosx = CosApproxConverge(x, epsThreshold);

truecos= cos(x);

err= abs(cosx- truecos)

% for 4pi, eps = 0.001, error is 9.6e-6
% error is much smaller than epsThreshold
% epsThreshold is comparing subsequent values of cosx adding on more terms
% and doesn't have a direct relationship to the difference between the
% actual value of cos and the approximation cosx.
% So, do not expect error to be the same as epsThreshold
%
% for epsThreshold = 0.0001, error is 8e-7
% for epsThreshold = 0.1, error is 0.009 (9e-3)
% so general trend is error is at least 2 orders of magnitude less than eps






