function[Wo]=gjWo(k, GJbet, GJdel)

global Faio GJAv h1 h2 h3 h4 f g;

Wo1= ( LLL(h2,Faio,(1-Faio)*GJdel,1,-h1) - LLL(h1,Faio,(1-Faio)*GJdel,1,-h1) )/(f*g);
Wo2= ( LL(h3,Faio,(1-Faio)*GJdel) - LL(h2,Faio,(1-Faio)*GJdel) )/f;
Wo3= ( LLL(h4,Faio,(1-Faio)*GJdel,-1,h4) - LLL(h3,Faio,(1-Faio)*GJdel,-1,h4) )/(f*g);

Wo = GJAv + log(k)/(1-GJbet) + (Wo1 + Wo2 + Wo3)*GJbet/((1-GJbet)^2) ;
