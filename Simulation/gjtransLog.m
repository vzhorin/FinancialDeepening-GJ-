% Simulation for evolution of wealth using real Thai data
% Log scale.
% This is the version used for the IMF working paper!
% by Kenichi Ueda
% 6/26/02 Revised for allocation of people in kgrid evolution -- but not change so use 1/2


clear all;
global KJ savk faik GJdel kgrid h1 h2 h3 h4 f g GJdel Faio GJsig m optsav;

%load OUTnew7ku;
%load OUTHC;
%load OUTEP;
%load OUTSA;
%load OUTnew17;
%load OUTCRSfin;
load OUTHMTC;

%GJsig=1 % if log utility

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
Ere=quadlg('ere1',h1,h2)+quadlg('ere2',h2,h3)+quadlg('ere3',h3,h4);
optsav0=(GJbet*(Ere))^(1/GJsig);

if GJsig==1
 optsav=GJbet;
 optsav0=GJbet;
end


T=30; %HIST7kuMay has 100 year
n=1600; % IMFWP version use 800
%scale=round(1900*91.0842/(CritK*100));  % round(1900/k*), 
				%1900 baht in monthly data k* in model 100 baht unit
            % 91.0842 is the factor to change monthly to annual.
%scale=round(220000/CritK);
%scale=round(1900/CritK); % Monthly 1 baht unit.           
%scale=205;  % keep same scale when restricted
%initialk=1;
%kup=initialk*((GJTB*optsav)^T)
kup=39.5; % 1/1 unit 800 grid 1/20 scale, used also for 1600 bins (maybe better with 0.25)
klow=0.5; % each corresponding to half of [0,1]
kgrid=linspace(klow,kup,n);

load gjpdlog76A216; %n=1600
%load gjpdlog76A2; %n=800
%load gjpdlog76;

AA=pd76;   % basispoint
%ZK=22000;
%ZK=1900;         % data: 6percent at 1900 and 1 baht is one unit
%ZK=3800;  % Restricted
%LZK=log(ZK);
LZK=0.939; % 6 percent participation
%CGK=GJk(ZK);
%zk=asorder(kgrid,LZK);
zk=asorder(cd76,LZK);
%m=zk-1; % IMFWP version with 800
m=zk;
ZK=exp(kgrid(m))
scale=round(ZK/CritK)
CGKA=log(ZK*(GJTB+GJEB));
zka=asorder(kgrid,CGKA);
ma=zka-1;

% Optimal Policy
np=64; % (# of polynomials = np+1);
[GJAS,GJAF]=Zsffun(Wsf,np);
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

% policies
koj=asorder(kgrid,log(0.1*scale)); % Very Poor
for j=1:koj-1
        savk(j)=optsav0;
        faik(j)=Faio;
end
for j=koj:m                   % Non participants
	K=exp(kgrid(j))/scale;
	for ii=1:np+1
			SFTT(ii)=cos((ii-1)*acos(2*(K-GJkA)/(GJkB-GJkA)-1)); % adjust for capital base of OUT.mat
	end
	sav=real(GJAS*SFTT');
	sav=min(0.9999,sav);
    sav=max(optsav0,sav);
	savk(j)=sav;
	fai=real(GJAF*SFTT');
	fai=max(0,fai);
	fai=min(1,fai);
	faik(j)=fai;
end

% Transition matrix
for i=1:ma
   Kpr=exp(kgrid(i))/scale;
		for j=1:m
			K =exp(kgrid(j))/scale;
			sav=savk(j);
			fai=faik(j);
			if fai==0
				[i,j]
				X=0;
			else	
            X=(Kpr/(sav*fai*K))-(((1-fai)*GJdel)/fai); %original
			end
			if X <= h1
				rcdf=0;
			elseif X >= h4
				rcdf=1;
			elseif X <= h2
				rcdf=((X-h1)^2)/(2*f*g);
			elseif X>h3
				rcdf=1-((h4-X)^2)/(2*f*g);
			else
				rcdf=((h2-h1)^2)/(2*f*g) + (X-h2)/f;
			end
			CDFN(i,j)=1-rcdf;
			if CDFN(i,j)==1;
				CDFN(i,j+1:m)=ones(1,m-j);
				break
			end
		end
end

'Finish CDFN (m*T)'

for i=1:n
	Kpr=exp(kgrid(i))/scale;
	%if i==1
		for j=1:n
			K =exp(kgrid(j))/scale;
			y=Kpr/(gam*optsav*K); %original
			if y<=GJdel
				rcdf=0;		
			elseif y>=GJTB;
				rcdf=1;
			else
				rcdf=(y-GJTA)/(GJTB-GJTA);
			end
			CDFB(i,j)=1-rcdf;
			if CDFB(i,j)==1;
				CDFB(i,j+1:n)=ones(1,n-j);
				break
			end
		end
end

'Finish CDFB (n*T)'

% Histogram
    %For revised allocation
    ek = exp(kgrid);
    wek= ek(1:n-1)./(ek(1:n-1)+ek(2:n));
    wek= [wek (1-wek(n-1))];
    
% Non-participant
A=AA(1:m);
A=A';
QN(:,1)=[A;zeros(ma-m,1)]; % Assume if k>m all participants at t=1
for t=2:T      				% Kimatu hyouka siteru t=1:T-1 de QN(:,t+1) to onaji
   AC=CDFN*A;
	AP=AC(1:ma-1)-AC(2:ma);
	%AQ=([0;AP]+[AP;0])/2;  % This is the original one in the IMF working paper
    AQ=[AP;0].*(ones(ma,1)-wek(1:ma)')+[0;AP].*wek(1:ma)'; % Revised allocation of people
	QN(:,t)=AQ;
	A=QN(1:m,t);
end
H=ones(1,T)-sum(QN(1:m,:)); % prop. of bank participants

% New participants flows into participants pool
DQA=zeros(n,T);
for i=m+1:ma
	capafter(i-m)= log(exp(kgrid(i))- GJq*scale) ;  % capital available to invest (net of cost q)
	gridm(i-m)=asorder(kgrid,capafter(i-m));
   DQA(gridm(i-m),:)=QN(i,:);
end

% Participants with new flows
B=AA(m+1:n);
B=B'; %'
QB=zeros(n,T);
QB(m+1:n,1)=B;
BA=QB(:,1);
for t=2:T
	QBhat=BA+DQA(:,t);
	ABC=CDFB*QBhat;
	ABP=ABC(1:n-1)-ABC(2:n);
	%ABQ=([0;ABP]+[ABP;0])/2; % This is the original one in the IMF working paper
    ABQ=[ABP;0].*(ones(n,1)-wek')+[0;ABP].*wek'; % Revised allocation of people
    QB(:,t)=ABQ;
	BA=ABQ;
end

% Capital distribution of both in and out
Q11=QN(1:m,:);
Q12=zeros(n-m,T);
Q1=[Q11 ; Q12];
CAPI=Q1+QB;


% Consumption and Savings
C11=zeros(m,T);
CB=zeros(n,T);
cgrid= kgrid + log(1-optsav);
S11=zeros(m,T);
SB=zeros(n,T);
sgrid= kgrid + log(optsav);

for j=1:m
	co=log(1-savk(j)) + kgrid(j);
   gridnum=asorder(cgrid,co);
   C11(gridnum,:)=Q11(j,:) + C11(gridnum,:);
 	so=log(savk(j)) + kgrid(j);
   gridnums=asorder(sgrid,so);
   S11(gridnums,:)=Q11(j,:) + S11(gridnum,:);
end
for j=1:n
	co=kgrid(j) + log(1-optsav);
   gridnum=asorder(cgrid,co);
   CB(gridnum,:)=QB(j,:) + CB(gridnum,:);
  	so=kgrid(j) + log(optsav);
   gridnumss=asorder(sgrid,so);
   SB(gridnumss,:)=QB(j,:) + SB(gridnum,:);
end
C1=[C11 ; Q12];
CONS=C1+CB;
nminus=n-gridnums;
S1=[S11 ; Q12(1:nminus,:)];
SAV=S1+SB;

% Income
% ygrid=cgrid;                % Turns out to be ygrid=cgrid.

% Non-participants
%for j=1:m
%   for i=1:ma
%   	yo=log(exp(kgrid(i))-exp(kgrid(j))*savk(j));
%   	gridnumy=asorder(ygrid,yo);      
%   	CDYB(gridnum,j) = CDFB(i,j);       



% Summary data - Population Level Ex Post Data
%popavek=kgrid*CAPI;
%popavec=cgrid*CONS;
%popaves=sgrid*SAV;
%dc2=diag(cgrid'*cgrid)';
%ec2=dc2*CONS;
%mc2=popavec.^2;
%popvarc=ec2-mc2;
%growmyuk=popavek(2:T)./popavek(1:T-1);
%growmyuc=popavec(2:T)./popavec(1:T-1);

% Since riches are out of grid, calculate analytically
Etet=(GJTA+GJTB)/2;
Vtet=((GJTB-GJTA)^2)/12;
Veps=((GJEB-GJEA)^2)/12;

tba=GJTB-GJTA;
del2=GJdel^2;
ta2=GJTA^2;
tb2=GJTB^2;
del3=GJdel^3;
ta3=GJTA^3;
tb3=GJTB^3;
Gd = (GJdel-GJTA)/(GJTB-GJTA);

Emtd=(tb2-del2)/(2*tba) + (Gd*GJdel);
Vmtd=Gd*((GJdel-Emtd)^2) + (1-Gd)*((Emtd^2)-(Emtd*(GJTB+GJdel))......
+((GJTB^2)+(GJdel*GJTB)+(GJdel^2))/3);



% Non-participants
avekN=exp(kgrid)*Q1;
growkN=(avekN(2:T)./avekN(1:T-1)).*(1-H(2:T)); % per person growth * #people
%dk2=diag(exp(kgrid)'*exp(kgrid))';
%ek2=dk2*Q1;
%mk2=avekN.^2;
%varkN=ek2-mk2;
sf2=(savk.*faik).^2;
varkN=(Vtet+Veps)*(sf2*Q11);

% New-participants
differs= exp(capafter - kgrid(m+1:ma));
Bt=optsav*differs*DQA(gridm,:);
growkW=Bt(2:T)*Emtd;
varkNew=Vmtd*Bt;

% Old-participants
growkO=optsav*H(2:T)*Emtd;

growk=growkO+growkN+growkW;

% Variance
%At=varkN./(Vtet+Veps);
%%cov1=GJdel*((GJdel^2)-(GJTA^2))/(2*f);
%cov2=((GJTB^3)-(GJdel^3))/(3*f);
%covall=cov1+cov2;
%vark=(At.^2)*Veps + ((At+Bt).^2)*Vtet + ((optsav*H).^2)*Vmtd  ....
%+2*(At+Bt).*(optsav*H)*covall;

varkB=Vmtd*(optsav^2)*H;
vark=varkN+varkNew+varkB;

for t=1:30
   Gini(t)=lzgini(kgrid,CAPI(:,t)'); %'
   Giniraw(t)=lzgini(exp(kgrid),CAPI(:,t)');
end

AllaggK=exp(kgrid)*CAPI;
Allgrowk=AllaggK(2:T)./AllaggK(1:T-1);

for t=1:30
   y=anasample2(CAPI(:,t),0.5,0.025,1002); % 1600 people precision (40/1600) to match gjpd
   J = length(y);
   Theil(t)=theil(exp(y'))/log(J); % Normalized
end
    

% 816 for finer allocation
save HISTHMTC scale CAPI CONS SAV H T kgrid cgrid sgrid ....
kup n growk vark Q11 Q1 QB QBhat C1 CB S1 SB Gini Giniraw Allgrowk Theil;