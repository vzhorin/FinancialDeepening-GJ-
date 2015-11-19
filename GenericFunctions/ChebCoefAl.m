function[A]=ChebCoefAl(funct,a,b,m,n);

% Use fliplr if use with matrix T
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

for k=1:m
	x(k)=cos(pi*(2*k-1)/(2*m));	%step1	
	z(k)=(x(k)+1)*((b-a)/2) + a;	%step2
	y(k)=feval(funct,z(k));			%step3
	for i=1:n+1
		T(k,i)=cos((i-1)*acos(x(k)));
	end
end
%for i=1:n+1
%	A(i)=(y*T(:,i))/sum(T2(:,i)); %step4
%end
A=((T'*T)\(T'*y'))';

		







