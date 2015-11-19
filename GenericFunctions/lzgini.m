function [gini,lrnz]=lzgini(sp,pr)
% Function that computes the Lorenz Curve and the Gini coefficient. 
% Input: support (sp),density (pr) and length of distribution (pts)
% Output: Lorenz Curve (lrnz) and Gini coefficient (gini).
% Automatically take care of too much support where actuall [0,a] 
% and here [0,b] with b>a, still gives correct Lorenz and Gini.
% By Kenichi Ueda 2000, edited a version originally from Xavi Gine.

totp   = sum(pr);
tot    = sum(sp.*pr); %         Total

%
lrnz(1,1) = 0; %                 x-axis
lrnz(2,1) = 0; %                 y-axis
%
pts=length(sp);
%
for lj=2:pts+1,
lrnz(1,lj) = lrnz(1,lj-1) + pr(lj-1)/totp;
lrnz(2,lj) = lrnz(2,lj-1) + (sp(lj-1)*pr(lj-1)/tot);
end
%
gini = 1 - sum( (lrnz(2,2:pts+1)+lrnz(2,1:pts))                ...
         .* (lrnz(1,2:pts+1)-lrnz(1,1:pts)) );

 
