% Monte Carlo simulation of GJ model, J people T periods
% Start with real wealth dist log---doesn't work! switch to level -> 2.m
% This is in level!

global J T tet GJsig gam GJkA GJkB GJdel K optsav optsav0 joinBank....
   	bankenter optsav CZK np GJAS GJAF GJq;
   
T=30;

load OUTBnew7;

% Control for random number generator
rand('state',0);

% initialization
   %load gjpd76;
   load gjpd76A2; % level version with 1000 grid
   %load gjpdlog76A216; %log version with 1600 grid
   
   %y=anasample2(pd76,50,100,500);  %for old initial distribution of wealth
   y=anasample2(pd76,5000,10000,1010); % bahts unit each entry is wealth level for 1000 people

   J = length(y)

   K=zeros(J,T);
   LZK=0.94; % 6 percent participation
   zk=round(J*LZK);
   ZK=y(zk)
   scale=ZK/CritK 
   
   K(:,1)=y'/scale; % initial distribution model unit
   npb=round(LZK*J);
   joinBankA=zeros(npb,T+1);
   joinBankB=ones(J-npb,T+1);
   joinBank=[joinBankA;joinBankB];

% policy function
	np=64; % (# of polynomials = np+1);
	CZK=CritK;
	[GJAS,GJAF]=Zsffun(Wsf,np);

% Participant's savings rate for CRRA
%   ers1=(gam^(1-GJsig))/(GJTB-GJTA);
%	ers2=(GJdel^(1-GJsig))*(GJdel-GJTA);
%	ers3=( (GJTB^(2-GJsig)) - (GJdel^(2-GJsig)) )/(2-GJsig);
%	Ers = ers1*(ers2+ers3);    
%	optsav=(GJbet*(Ers))^(1/GJsig)

% Participant's savings rate for log
    if GJsig==1
        optsav=GJbet;
        optsav0=GJbet;
    end
    
    gdpg=[];
    gini=[];
    findp=[];
    tet=[];
    
    save gjmonBnew9 gdpg gini findp tet

% Big Loop
MT=1000;
for mtc=1:MT
    load gjmonBnew7finTEST2
% shock
    etam= rand((J+1),T);
  	tx  = etam((J+1),:);
	ex  = etam(1:J,:);
	tet = (tx*(GJTB-GJTA))+(GJTA*ones(1,T));
	eps = (ex*(GJEB-GJEA))+(GJEA*ones(J,T));
  	eta = (ones(J,1)*tet)+eps;
   
% simulation---Reported in model unit!
	[B,K]=GJEngine2(eta);

	sumK = sum(K);
	gdpg(mtc,:) = 100*(sumK(2:T+1)./sumK(1:T)) - 100;
	findp(mtc,:)= sum(B)/J;

	for t=1:T
   	gini1(t) = ginipure(K(:,t));
	end
    gini(mtc,:)=gini1;
    tet(mtc,:)=tet;

save gjmonBnew7fin gdpg gini findp tet
clear gdpg gini findp tet
mtc
end