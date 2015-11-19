function[e2]=ere2(x, GJdel, GJsig, Faio, f)

%global Faio f;

e2 = ( ( Faio*x + (1-Faio)*GJdel )^( 1-GJsig ) ) / f;
