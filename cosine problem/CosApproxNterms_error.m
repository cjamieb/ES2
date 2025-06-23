% CosApproxNterms_error
% calls function CosApproxNterms
% cosx = CosApproxNterms(x,nTerms)
% HW3, problem 1 part 2

clear; clc

%%% ==================================================================
%%% part a
% compare real & approx at x= 0;
x= 0;
cosx = CosApproxNterms(x,1);
truecos = cos(x);

err_a= abs(cosx- truecos)

% err_a = 0, both terms are exactly 1, regardless of n

%%% ==================================================================

%%% part b
% What is the difference between cosx and cos(x) for x = pi/2 using 10 terms? 

x= pi/2; n= 10;
cosx = CosApproxNterms(x,n);
truecos = cos(x);

err_b= abs(cosx- truecos)

% err_b = 3.4e-15, pretty close to 0 already, with just 10 terms

%%% ==================================================================

%%% part c
% How many terms are you comfortable with in general for this approximation?
% let's try another value for x
x= 4*pi; 
n= 20;
cosx = CosApproxNterms(x,n);
truecos = cos(x);

err_c= abs(cosx- truecos)

% error for 10 terms for 4*pi = 2.9e3
% 10 terms was pretty good for pi/2, but bad for x= 4*pi
% very much depends on x
% so definitely more than 10
% 20 terms for 4*pi has error= 1.04e-4, which is pretty good

%%% ==================================================================

%%% part d
x= 2*pi; n= 10;
tic
cosx = CosApproxNterms(x,n);
toc

tic
truecos = cos(x);
toc

% for 100 terms, an order of magnitude longer
% times = 0.001753 for approx, 0.000143 for built in
% for 10 terms, twice as slow
% times = 0.00050 for approx, 0.000223 for built in

%%% ==================================================================
