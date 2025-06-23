function fVal = MyFactorial(n)
% function fVal = MyFactorial(n)
% computes n! using a for loop
% n = number to evaluate (integer)
% fVal = factorial of n


if n < 0
    fVal = NaN;
else
    fVal = 1;
    for i = 1:n
        fVal = fVal *i;
    end
end

% Note: can add another if statement for the 0 case (if n==0, fVal=1, end), 
% but this also works because if n==0, the for loop doesn't run, so fVal = 1
