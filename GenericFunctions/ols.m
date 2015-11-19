function[b,Vb,RVb,se,Rse,t,Rt,Rsq] = ols(y,x);

%OLS estimator by Kenichi Ueda, originally developed in 1993.
%Last Updated in 2004.
%    [b,V]=ols(y,x) returns beta and its cov.matrix.
%    You can pick also for se, tstat and/or R^2.

[n,k]=size(x);
Q=x'*x;
A=Q\x';
b=A*y;

% Variance of residual
e=y-x*b;
%sig=e'*e/n;
sig=e'*e/(n-k); % unbiased estimator mean squared residual

% Variance of OLS estimator
Vb=sig*inv(Q);

% Robust Variance
S0=zeros(k,k);
for i=1:n
   S0=x(i,:)'*x(i,:)*(e(i)^2)+S0;
end   
RVb=inv(Q)*S0*inv(Q);

% Standard Errors
se=sqrt(diag(Vb));
Rse=sqrt(diag(RVb));

% T-stat
t=b./se;
Rt=b./Rse;

% R^2
Rsq=1-(e'*e)/(y'*y);