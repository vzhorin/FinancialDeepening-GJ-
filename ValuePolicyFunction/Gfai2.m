function[G2]=Gfai2(x, GJdel)
global fai f;

G2=((x-GJdel)/(fai*x+(1-fai)*GJdel))/f;
