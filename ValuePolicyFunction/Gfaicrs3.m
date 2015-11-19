function[G3]=Gfaicrs3(x, GJdel, GJsig);
global fai h4 f g;

G3=((x-GJdel)/((fai*x+(1-fai)*GJdel)^GJsig))*((h4-x)/(f*g));
