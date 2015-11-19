function[n]=asorder(A,x);
% given ascending vector A and number x, return n.
% n is the order if x is in vector A
% e.g. A=[1 2 3 4] x=2.5, asorder(A,x)=3
% x is the third smallest in A.
% By Kenichi Ueda 1996
% There can be a different treatment for the value outside A
% --> This option can be changed in the m code--2004 update.

m=length(A);
B=A - x*ones(1,m);
[y,i]=min(abs(B));
%if isreal(y)==1
if B(i)>=0
    n=i;
else
    % n='n.a.';
    n=i+1;
    %n=m; % the last one
end