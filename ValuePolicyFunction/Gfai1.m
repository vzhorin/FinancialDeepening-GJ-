function[G1]=Gfai1(x, GJdel)
global fai h1 f g;

G1=((x-GJdel)/(fai*x+(1-fai)*GJdel))*((x-h1)/(f*g));
