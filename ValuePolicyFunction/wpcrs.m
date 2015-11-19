function[wp]=wpcrs(x, GJdel, GJq, GJA);
% given shock x, return w

global GJKJ SSS FFF GJnp GJkA GJkB;

y=GJKJ*SSS*(FFF*x+(1-FFF)*GJdel);
if y<GJkA
	wp=GJcrsw0(y);
elseif y>GJkB
	wp=GJcrsv(y-GJq);
else
	wp=gjWchebap(y);
end
