function[F]=ChebCoef(fnct,x,a,b,m,n);

% Chebyshev Coefficient Algorithm
% Approximation by one of orthogonal polynomials
% known as Chebyshev polynomials.
% By Chebyshev Theorem ?, it is assured that 
% approximaiton is well determined and quickly obtained.
% funct is function with domain [a,b].
% Approximate by n polynomials at m points.
% See Judd, "Numerical Methods in Economics"
% By Kenichi Ueda 1997

% Step 1: Compute the m>=n+1 Chebyshev interpolation nodes on [-1,1]:
% Step 2: Adjust te nodes to the [a,b] interval:k=1:m
% Step 3: Evaluate f at the approximation nodes:k=1:m
% Step 4: Compute Chebyshev coefficients, Ai:i=1:n

A=ChebCoefAl(fnct,a,b,m,n);

for i=1:n+1
	T(i)=cos((i-1)*acos(2*(x-a)/(b-a)-1));
end
F=A*T';
		


