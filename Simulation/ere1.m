function[e1]=ere1(x, GJdel, GJsig, Faio, f, g, h1)

%global Faio f g h1;

e1 = ( ( Faio*x + (1-Faio)*GJdel )^( 1-GJsig ) ) * ( x-h1 ) / (f*g);
