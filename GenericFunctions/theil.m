function[eone]=theil(y)

  % This is part of inequality.m, developed by Kenichi Ueda in 1998
  % y is wealth matrix, N people in row T periods in column
  % Gini and the entropy mesure for inequality
  % The range is [0,log(N)]
  % If normalization is needed, divide by log(N)
  % By Kenichi Ueda 2002
  
  [N,T]=size(y);
  mu=ones(N,1)*mean(y);
  x=y./mu;
  e=x.*log(x);
  eone=sum(e)/N;