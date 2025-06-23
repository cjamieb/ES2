clear, clc;

n = 10000;
%n = 395
sensitivity = 0.98;
specificity = 0.97;
infected = 0.01;

sick = infected*n
notsick = n-sick

truepostest = 0.98*sick
%truepostest = 96
truenegtest = 0.97*notsick
%truenegtest = 2

falsenegtest = abs(sick - truepostest)
%falsenegtest = 288
falsepostest = abs(notsick - truenegtest)
%falsepostest = 9


table(truepostest, truenegtest, sick, notsick, falsepostest, falsenegtest)

testpos = truepostest + falsepostest
testneg = truenegtest + falsenegtest

PPV_truetests = truepostest/testpos
PPV_falsetests = falsepostest/testpos
NPV_truetests = truenegtest/testneg
NPV_falsetests = falsenegtest/testneg


