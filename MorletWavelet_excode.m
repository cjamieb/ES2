% MorletWavelet_excode
% Campbell Braun
% HW2 #2 - explore the code, then answer the questions at the bottom

% NOTE:
% Is it smart to re-write the same equation a million times in one script?
% NO! (rhetorical question) When we get to functions that will solve that
% problem for us! (Right now if I had a typo I'd have to fix it EVERYWHERE
% ALSO, I'm over-writing f0 and sigma constantly! Not ideal.

clear; clc; clf

% for all parts, t is:
t = linspace(-3,3,301);

% ======================================================================
% part a
f0= 2;
sigma = 0.5;

psi = cos(2*pi*f0.*t) .* exp(-t.^2. / (2.*sigma.^2));   % full Psi_M

psi1 = cos(2*pi*f0.*t);             % just cosine part
psi2 = exp(-t.^2. / (2.*sigma.^2)); % just exponential part

figure(1)

subplot 211
plot(t,psi,'-')
xlabel('t'), ylabel('\Psi_M'), title('\Psi_M vs. t')

subplot 212
plot(t,psi1,'g',t,psi2,'r')
xlabel('t'), ylabel('cos and exp'), legend('cos part','exp part')
title('components of \Psi_M vs. t')

% ======================================================================
% part b

figure(2)

subplot 311
plot(t,psi,'k-') % default values, same as part a top subplot
xlabel('t'), ylabel('\Psi_M'), title('f_0 = 2, \sigma = 0.5')

% NOTE: default is f0= 2; sigma = 0.5;

% Compare 2 values of f0
f0= 3;      % larger f0
sigma = .5;  
psi_f01 = cos(2*pi*f0.*t) .* exp(-t.^2. / (2.*sigma.^2));

f0= 1;      % smaller f0
sigma = .5;
psi_f02 = cos(2*pi*f0.*t) .* exp(-t.^2. / (2.*sigma.^2));

subplot 312
plot(t,psi_f01,'b',t,psi_f02,'r')
legend('f_0 = 3, \sigma = 0.5','f_0 = 1, \sigma = 0.5')
xlabel('t'), ylabel('\Psi_M'), title('Changing f_0')

% Compare 2 values of sigma
f0= 2; 
sigma = 1;    % larger sigma
psi_sig1 = cos(2*pi*f0.*t) .* exp(-t.^2. / (2.*sigma.^2));

f0= 2; 
sigma = .1;   % smaller sigma
psi_sig2 = cos(2*pi*f0.*t) .* exp(-t.^2. / (2.*sigma.^2));

subplot 313
plot(t,psi_sig1,'b',t,psi_sig2,'r')
legend('f_0 = 2, \sigma = 1','f_0 = 2, \sigma = 0.1')
xlabel('t'), ylabel('\Psi_M'), title('Changing \sigma')


% ======================================================================
% part c
% This is an extra plot for you to play with variables
f0 = 1; % CHANGE
sigma = 1; % CHANGE
psi5 = cos(2*pi*f0.*t) .* exp(-t.^2. / (2.*sigma.^2));   % new Psi_M

figure(3)
plot(t,psi,'k',t,psi5,'r')
legend('original','testing values')

% ======================================================================

% QUESTIONS for parts a & b:
% How do you create multiple plots within one figure window?
% answer: use figure() to create a figure and then use subplot() before each plot
% How do you get greek letters on a plot? 
% answer: put a "\" before the term you want to use, like "\sigma"
% How do you get subscripts on your plot?
% answer: put an underscore before the subscript, like "\Psi_M"
% What is another fun text thing you can do on plots? (use help or doc)
% answer: You can also increase font size by typing "fontsize('increase')"
% How do you create another figure window? 
% answer: using figure(#), using a number that follows the last figure #
    % [Ex. figure(2) would work if your last figure was figure(1)]
% How do you create a legend? 
% answer: using legend() & inputing the legend labels, like legend('V')


% Part C questions
% How does f0 change the shape of the graph? (high f0 does... lower f0...)
% answer: With a larger f0, the period is smaller & with a smaller f0, the period is larger
% How does sigma change the shape? (higher sigma... lower sigma...)
% answer: With a larger sigma, the frequency is larger & with a smaller sigma, the frequency is smaller
% What values of f0 and sigma do you need to create a graph with 5
% peaks, but wider in shape than the original? 
% answer: f0 = 1 and sigma = 1


