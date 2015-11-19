function[y]=gjInifun(x);

% This is Log. Use gjInifunCr for CRRA.
global IAB;

y=IAB(1)*log(x)+IAB(2);

