clear, clc;

a = 1;

r = 0.1;

sum_converge = a/(1-r)

n = 10;

diff = 0;

while diff > 1E-10

    n = n + 1;
    sum_series = a*((1-r^n)/(1-r));
    diff = abs(sum_converge - sum_series);

end