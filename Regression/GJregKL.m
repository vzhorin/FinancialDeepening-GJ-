clear all;

diary GJregKL80logY.log
%diary GJregKL85logY.log

load gjmonBnew7fin; % 1000*30*1000 data 
%load gjmonBnew13;
[M,TT]  = size(gini);

it=5
'1980'
%it=10
%'1985'

T=20
'20 yr ave'

summer=ones(1000,1);

igini=gini(:,it);
%igini=log(igini); %for log version
rgini=[summer igini];
ginig=100*(gini(:,it+1:it+T)./gini(:,it:it+T-1)-1);
mginig=mean(ginig')';

ifindp=findp(:,it);
%ifindp=log(ifindp); % for log version
rfindp=[summer ifindp];
findpg=100*(findp(:,it+1:it+T)./findp(:,it:it+T-1)-1);
mfindpg=mean(findpg')';

mgdpg=mean(gdpg(:,it:it+T-1)')';
multi=1+gdpg/100;
gdp=ones(1000,it+1);
for i=1:it
    gdp(:,i+1)=gdp(:,i).*multi(:,i);
end
igdp=gdp(:,it);
igdp=log(igdp); % for log version
rgdp=[summer igdp];

Rf=[rfindp igdp];
Rg=[rgini igdp];
Rfg=[rfindp igini igdp];

[b1,Vb1,RVb1,se1,Rse1,t1,Rt1,Rsq1]=ols(mgdpg,rfindp);
'YG IF'
[b1';t1';Rt1']
Rsq1

[b2,Vb2,RVb2,se2,Rse2,t2,Rt2,Rsq2]=ols(mfindpg,rgdp);
'FG IY'
[b2';t2';Rt2']
Rsq2

[b3,Vb3,RVb3,se3,Rse3,t3,Rt3,Rsq3]=ols(mgdpg,rgini);
'YG IG'
[b3';t3';Rt3']
Rsq3

[b4,Vb4,RVb4,se4,Rse4,t4,Rt4,Rsq4]=ols(mginig,rgdp);
'GG IY'
[b4';t4';Rt4']
Rsq4

[b5,Vb5,RVb5,se5,Rse5,t5,Rt5,Rsq5]=ols(mginig,rfindp);
'GG IF'
[b5';t5';Rt5']
Rsq5

[b6,Vb6,RVb6,se6,Rse6,t6,Rt6,Rsq6]=ols(mfindpg,rgini);
'FG IG'
[b6';t6';Rt6']
Rsq6

[b7,Vb7,RVb7,se7,Rse7,t7,Rt7,Rsq7]=ols(mgdpg,Rf);
'YG IF IY'
[b7';t7';Rt7']
Rsq7

[b8,Vb8,RVb8,se8,Rse8,t8,Rt8,Rsq8]=ols(mfindpg,Rg);
'YG IG IY'
[b8';t8';Rt8']
Rsq8

[b9,Vb9,RVb9,se9,Rse9,t9,Rt9,Rsq9]=ols(mfindpg,Rfg);
'YG IF IG IY'
[b9';t9';Rt9']
Rsq9



diary off