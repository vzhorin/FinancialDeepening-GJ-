function[G2]=Gfaicrs2(x, GJdel, GJsig);
global fai h4 f g;

G2=((x-GJdel)/((fai*x+(1-fai)*GJdel)^GJsig))/f;
