%global f g h1 h2 h3 h4 GJsig GJdel;

h1    = GJTA+GJEA;
h4    = GJTB+GJEB;
if (GJTB-GJTA) >= (GJEB-GJEA)
	f     = GJTB-GJTA;
	g     = GJEB-GJEA; 
	h2    = GJTA+GJEB;
	h3    = GJTB+GJEA;
else
	g     = GJTB-GJTA;
	f     = GJEB-GJEA;
	h3    = GJTA+GJEB;
	h2    = GJTB+GJEA;
end	

ers1=(gam^(1-GJsig))/(GJTB-GJTA);
ers2=(GJdel^(1-GJsig))*(GJdel-GJTA);
ers3=( (GJTB^(2-GJsig)) - (GJdel^(2-GJsig)) )/(2-GJsig);
Ers = ers1*(ers2+ers3);
optsav=(GJbet*(Ers))^(1/GJsig);

Ee=(GJTB+GJTA)/2;
%Ere=quadlg('ere1',h1,h2)+quadlg('ere2',h2,h3)+quadlg('ere3',h3,h4);
Ere= quadlg(@(x) ere1(x, GJbet, GJdel, Faio, f, g, h1),  h1, h2) + quadlg(@(x) ere2(x, GJbet, GJdel, Faio, f),  h2, h3) + quadlg(@(x) ere3(x, GJbet, GJdel, Faio, f, g, h4),  h3, h4);

optsav0=(GJbet*(Ere))^(1/GJsig);

if GJsig==1
 optsav=GJbet;
 optsav0=GJbet;
end

bett0=ones(1,100)*optsav0; % non-participant
bettV=ones(1,100)*optsav;  % participant
faioo=ones(1,100)*Faio;


hold on
plot(GJk,Wsf(2,:),'k')
plot(GJk,faioo,'k--')
%plot(GJk,SS,'w')
hold off
axis([GJkA GJkB Faio-0.2 min(Faio+0.2,1)])
%axis([GJkA 10 0.75 0.95])
%title('Savings Rate')
%xlabel('capital')
ylabel('risky investments share')
legend('W policy','Wo policy','V policy',4)