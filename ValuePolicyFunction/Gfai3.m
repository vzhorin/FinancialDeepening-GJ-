function[G3]=Gfai3(x, GJdel)
global fai h4 f g;

G3=((x-GJdel)/(fai*x+(1-fai)*GJdel))*((h4-x)/(f*g));
