function[w]=gjWchebap(y, GJA)
% function w(y;A) 
% given Chebyshev coefficient A, return w(y)
% y is capital

global GJnp GJkA GJkB;
ind_max = GJnp+1;
%TT = zeros(ind_max, 1);
ind_temp = (1:ind_max);
TT = cos((ind_temp-1)*acos(2*(y-GJkA)/(GJkB-GJkA)-1));
%for i=1:GJnp+1
%	TT(i)=cos((i-1)*acos(2*(y-GJkA)/(GJkB-GJkA)-1));
%end
w=real(GJA*TT');
