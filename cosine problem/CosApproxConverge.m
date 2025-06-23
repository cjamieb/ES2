function cosx = CosApproxConverge(x, epsThreshold)
% function cosx = CosApproxConverge(x, epsThreshold)
% approximate value of cos(xVal).  Adds terms until 
% relative error drops below epsThreshold
% x = value to evaluate cos
% epsThreshold = diff between terms
% cosx= cosine approximation at x


% starting out
cosxOld = 1;

sgn = -1;  % first term is neg
pow = 2;
cosxNew = cosxOld + sgn.*x.^pow./MyFactorial(pow);  % 2nd term

while (abs(cosxNew - cosxOld)/abs(cosxNew)) >= epsThreshold
    cosxOld = cosxNew;
	pow = pow + 2;  % power needs to increase by 2, always even
	sgn = -1*sgn;   % alternate sign
	
	cosxNew = cosxNew + sgn.*x.^pow./MyFactorial(pow);
end

% all done; use latest estimate
cosx = cosxNew;


