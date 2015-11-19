function[L]=LL(x,a,b);

% integral log(ax+b) dx
if (b+(a*x)) <= 0
	L=-100000;
elseif a==0
	L=log(b)*x;
else
	L= -x + b*log(b + (a*x))/a + x*log(b + (a*x));
end
