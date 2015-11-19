% 5 yr panel
clear all;

diary GJregFBtime76Log.log
%diary GJregFBtime76LogNoTD.log
% (See last 2 or 3 coefficients)

load gjmonBnew7fin; % 1000*30*1000 data 
[M,TT]  = size(gini);
clear tet;

term=1; % 1976-80 initial
%term=2; % 1981-85 initial

T=5;
'5 yr ave'
S=6-term;
'4 panel prds'

td=timedum(M,S,0);

summerB=feconst(M,S);
magini=mvave2(gini,S);
maginiB=reshape(magini(:,term:T)',S*1000,1);

mafindp=mvave2(findp,S);
mafindpB=reshape(mafindp(:,term:T)',S*1000,1);

multi=1+gdpg/100;
gdp=ones(1000,TT+1);
for i=1:TT
    gdp(:,i+1)=gdp(:,i).*multi(:,i);
end
magdp=mvave2(gdp,S);
magdpB=reshape(magdp(:,term:T)',S*1000,1);
magdpB=log(magdpB); % for log version

%Xf=[summerB mafindpB magdpB];
Xf=[summerB td mafindpB magdpB];

magdpg=mvave2(gdpg,S);
Y=reshape(magdpg(:,term+1:T+1),S*1000,1);

[b1,Vb1,RVb1,se1,Rse1,t1,Rt1,Rsq1]=ols(Y,Xf);
'YG FE F IY'
[b1';t1';Rt1']
Rsq1

clear Xf b1 Vb1 RVb1 se1 Rse1 t1 Rt1 Rsq1;

%Xg=[summerB maginiB magdpB];
Xg=[summerB td maginiB magdpB];
[b2,Vb2,RVb2,se2,Rse2,t2,Rt2,Rsq2]=ols(Y,Xg);
'YG FE G IY'
[b2';t2';Rt2']
Rsq2

clear Xg b2 Vb2 RVb2 se2 Rse2 t2 Rt2 Rsq2;

%Xfg=[summerB mafindpB maginiB magdpB];
Xfg=[summerB td mafindpB maginiB magdpB];
[b3,Vb3,RVb3,se3,Rse3,t3,Rt3,Rsq3]=ols(Y,Xfg);
'YG FE F G IY'
[b3';t3';Rt3']
Rsq3

diary off