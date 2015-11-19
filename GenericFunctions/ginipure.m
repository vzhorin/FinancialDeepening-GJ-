function[gini]=ginipure(y)
% Gini only, optimized with matrix.
% See "Everyone's Miracle?" WB1997 
% need y = n*1 vector 
% by Kenichi Ueda 1998

  n=length(y);
  mu=mean(y);
  Z=y*ones(1,n);
  W=abs(Z-Z');
  gini=sum(sum(W))/(2*(n^2)*mu);
