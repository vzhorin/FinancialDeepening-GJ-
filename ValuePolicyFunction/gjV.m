function[v]=gjV(k, GJbet)

% return v
global GJAv GJBv ;
n=length(k);
v=ones(1,n);
if min(k)<=0
	[M,I]=min(abs(k));
	if k(I)>0;
		m=I;
	else
	 	m=I+1;
	end
	v(1:m-1)=-1e4*ones(1,m-1);
	Cv   = log(k(m:n))/(1-GJbet);
	v(m:n)  = GJAv + GJBv + Cv;
else
	Cv   = log(k)/(1-GJbet);
	v    = GJAv + GJBv + Cv;
end
