function[y]=gro2level(x)
% gro2level(x), x is J by T (period) matrix
% Given net growth rate (0.05, not 1.05, not 5%),
% Assign 1 for the initial level and
% Calculate levels for subsequent years
% By Kenichi Ueda 2003

[J,T]=size(x);
xx=ones(J,T)+x;
y=ones(J,T+1);
for t=2:T+1
    y(:,t)=y(:,t-1).*xx(:,t-1);
end