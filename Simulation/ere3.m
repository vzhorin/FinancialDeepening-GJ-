function[e3]=ere3(x, GJdel, GJsig, Faio, f, g, h4)

%global Faio f g h4; 

e3 = ( ( Faio*x + (1-Faio)*GJdel )^( 1-GJsig ) ) * ( h4-x ) / (f*g);
