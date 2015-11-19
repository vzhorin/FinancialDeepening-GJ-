function[wp]=wp(x, GJbet, GJdel, GJq, GJA)
% given shock x, return w

global GJKJ SSS FFF GJkA GJkB;

y=GJKJ*SSS*(FFF*x+(1-FFF)*GJdel);
if y<GJkA
	wp=gjWo(y, GJbet, GJdel);
elseif y>GJkB
	wp=gjV(y-GJq, GJbet);
else
	wp=gjWchebap(y, GJA);
end
