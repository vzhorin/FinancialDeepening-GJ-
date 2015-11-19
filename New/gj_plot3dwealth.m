function gj_plot3dwealth(policy_file, hist_file)
%Make 3D graphs
%clear all;
% Data

load(policy_file);
load(hist_file);

% parameter
T=30;
p=n/100;

% Create series
for t=1:T
	for i=1:100
		capital(i,t)=sum(CAPI(1+(i-1)*p:p*i,t));
		noncapi(i,t)=sum(Q1(1+(i-1)*p:p*i,t));
		bancapi(i,t)=sum(QB(1+(i-1)*p:p*i,t));
		consump(i,t)=sum(CONS(1+(i-1)*p:p*i,t));
		noncons(i,t)=sum(C1(1+(i-1)*p:p*i,t));
		bancons(i,t)=sum(CB(1+(i-1)*p:p*i,t));		
	end
end

if GJsig==1
 optsav=GJbet;
 optsav0=GJbet;
end
klow=kgrid(1);
hx=linspace(klow,kup,1600);
ht=linspace(1976,2005,T);
hc=hx*(1-optsav);

Ecap=exp(CAPI(:,1:T));
hex=exp(hx);

% Construct 3D figure
% Change axis properties in the matlab figure editor
% -- wealth (Y axis) needs to be log scale.
% View needs to be modified, too.
surfl(ht,log(hex),CAPI);
xlabel('period')
ylabel('wealth')
zlabel('population')
axis([1976,2000,log(1e3),log(1e7),0,0.004]) 
title('Wealth Evolution')
