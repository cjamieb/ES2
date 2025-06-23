function cosx = CosApproxNterms(x,nTerms)
% function cosx = CosApproxNterms(x,nTerms)
% COSAPPROX_NTERMS Computes the (n-1)th degree expansion of sin(x)
% x = value to evaluate cos
% nTerms = number of terms
% cosx= cosine approximation at x

cosx = 1; % first term (this is the output if nTerms=1)

c = -1; % first term is neg
for n = 1 : nTerms-1    % only go to nTerms-1 because 1st term is 1 
	pow = 2*n;      % always even 
    cosx = cosx + c.*x.^(pow)./MyFactorial(pow);
    c = -1*c;       % next coeff (to alternate signs)
end

