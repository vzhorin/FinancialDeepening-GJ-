function[L]=LLL(x,a,b,c,d)

% integral (cx+d)log(ax+b) dx
if (b+(a*x))<=0
	L=-100000;
elseif a==0
	L=log(b)*(c*(x^2)/2 + d*x);
else
	L=((b*c - 2*a*d)*x)/(2*a) - (c*(x^2))/4 ......
 	+ ((-((b^2)*c) + 2*a*b*d)*log(b + (a*x)))/(2*(a^2))......
	+ (x*(2*d + c*x)*log(b + (a*x)))/2;
end
