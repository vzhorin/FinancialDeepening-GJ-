diary OUTSA.log;
% Simulation for evolution of wealth using real Thai data
% Log scale.
% Conditional on aggregate shock
% This is the version used for the 2nd resubmission to RES.
% by Kenichi Ueda
% 6/26/02 Revised for allocation of people in kgrid evolution -- but not change so use 1/2
% 5/18/04, Streamlined

clear all;
global KJ savk faik GJdel kgrid h1 h2 h3 h4 f g GJdel Faio GJsig m optsav;

%load OUTnew7ku;
%load OUTnew15;
%load OUTnew17;
%load OUTHighRV;
%load OUTMidRV;
%load OUTHM;
% load OUTEP;
load OUTSA;

GJsig=1 % if log utility

% Optimal policies, given unknown shocks

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

% Parameters

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
kup=39.5; % 1/1 unit 800 grid 1/20 scale
klow=0.5; % each corresponding to half of [0,1]
kgrid=linspace(klow,kup,n);

load gjpdlog76A216; % for n=1600
%load gjpdlog76A2;  % for n=800
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
			SFTT(ii)=cos((ii-1)*acos(2*(K-GJkA)/(GJkB-GJkA)-1));
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

% Big Simulation
S=1000;
for s=1:S
    'big iteration'
    s
    bigtheta=rand(1,T)*(GJTB-GJTA) + GJTA;
    tic;
    
  % Histogram
    %For revised allocation
    %ek = exp(kgrid);
    %wek= ek(1:n-1)./(ek(1:n-1)+ek(2:n));
    %wek= [wek (1-wek(n-1))];
    
    % Set-up
    A=AA(1:m);
    A=A';
    QN(:,1)=[A;zeros(ma-m,1)]; % Assume if k>m all participants at t=1
    
    B=AA(m+1:n);
    B=B'; %'
    QB=zeros(n,T);
    QB(m+1:n,1)=B;

   for t=2:T      				% Kimatu hyouka siteru t=1:T-1 de QN(:,t+1) to onaji
      
      thetamt=bigtheta(t);
      
      % Formulate Transition Function for each Theta m
      h2m=GJEA+thetamt;
      h3m=GJEB+thetamt;
      if GJdel>=thetamt
          rthetamt=GJdel;
      else
          rthetamt=thetamt;
      end
      
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
				if X <= h2m
					rcdf=0;
				elseif X >= h3m
					rcdf=1;
				else
					rcdf=(X-h2m)/(GJEB-GJEA);
				end
				CDFN(i,j)=1-rcdf;
				if CDFN(i,j)==1;
					CDFN(i,j+1:m)=ones(1,m-j);
					break
				end
			end
		end
		
		% 'Finish CDFN (m*T)'
		
		for i=1:n
		 Kpr=exp(kgrid(i))/scale;
		 %if i==1
			for j=1:n
				K =exp(kgrid(j))/scale;
				y=Kpr/(gam*optsav*K); %original
				if y>=rthetamt
					rcdf=1;		
                else
					rcdf=0;
				end
				CDFB(i,j)=1-rcdf;
				if CDFB(i,j)==1;
					CDFB(i,j+1:n)=ones(1,n-j);
					break
				end
			end
		end
		
		%'Finish CDFB (n*T)'      
          
      % Histgram--Non-Participants
      AC=CDFN*A;
	  AP=AC(1:ma-1)-AC(2:ma);
	  AQ=([0;AP]+[AP;0])/2;  % This is the original one in the IMF working paper
      %AQ=[AP;0].*(ones(ma,1)-wek(1:ma)')+[0;AP].*wek(1:ma)'; % Revised allocation of people
	  QN(:,t)=AQ;
	  A=QN(1:m,t);    

      % New participants flows into participants pool
      DQA=zeros(n,1);
      for i=m+1:ma
	    capafter(i-m)= log(exp(kgrid(i))- GJq*scale) ;  % capital available to invest (net of cost q)
	    gridm(i-m)=asorder(kgrid,capafter(i-m));
        DQA(gridm(i-m))=QN(i,t);
      end

      % Histgram--Participants with new flows
      BA=QB(:,t-1);
	  QBhat=BA+DQA;
	  ABC=CDFB*QBhat;
	  ABP=ABC(1:n-1)-ABC(2:n);
	  ABQ=([0;ABP]+[ABP;0])/2; % This is the original one in the IMF working paper
      %ABQ=[ABP;0].*(ones(n,1)-wek')+[0;ABP].*wek'; % Revised allocation of people
      QB(:,t)=ABQ;
	  BA=ABQ;
   end % Time end

% Capital distribution of both in and out
Q11=QN(1:m,:);
Q12=zeros(n-m,T);
Q1=[Q11 ; Q12];
CAPI=Q1+QB;
AdCAP=CAPI./(ones(n,1)*sum(CAPI));

for t=1:T
    EffeSize(t)=length(nonzeros(CAPI(:,t)));
end

H(s,:)=ones(1,T)-sum(QN(1:m,:)); % prop. of bank participants
AllaggK=exp(kgrid)*AdCAP;
Allgrowk(s,:)=AllaggK(2:T)./AllaggK(1:T-1);

for t=1:30
   %y=anasample2(AdCAP(:,t),0.5,0.05,1002); % 800 people precision (40/800) to match gjpd
   y=anasample2(AdCAP(:,t),0.5,0.025,1002); % 1600 people precision (40/1600) to match gjpd
   J = length(y);
   Theil(s,t)=theil(exp(y'))/log(J); % Normalized
end
toc    
end % S simulation end

% 816 for finer allocation
%save HIST7ku scale CAPI CONS SAV H T kgrid cgrid sgrid ....
%kup n growk vark Q11 Q1 QB QBhat C1 CB S1 SB Gini Giniraw Allgrowk Theil;
% SimCond7
% SimCond17
% SimMidRV
%SimHM
%SimSA
save SimSA scale kgrid Allgrowk H Theil;
diary off;