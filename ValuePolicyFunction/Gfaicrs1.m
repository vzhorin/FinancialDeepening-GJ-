function[G1]=Gfaicrs1(x, GJdel, GJsig);
global fai h1 f g;

G1=((x-GJdel)/((fai*x+(1-fai)*GJdel)^GJsig))*((x-h1)/(f*g));
