function[y]=gjInifun(x, GJsig);

% This is Log. Use gjInifunCr for CRRA.
global IAB;

y=IAB(1)*((x^(1-GJsig))/(1-GJsig))+IAB(2);

