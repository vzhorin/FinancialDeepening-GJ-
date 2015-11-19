clear all;

T=30;
N=1002;
S=1000;
p=57;

% Analytical Moments--Unconditional expected path
%load HIST7ku; %figAveE
%load HIST17; %figAveEA
load HISTRur;
%load HISTUrb;
%load HISTLedu;
%load HISTHedu;

T=30;
afindp=H;
agdpg=Allgrowk-1;
athidx=Theil;

% Actual data
load thaigro;
load thaidatRur;
%oad thaidatUrb;
%load thaidatLedu;
%load thaidatHedu;

rfindp=part/100;
rgdpg=grinc/100;
rthidx=TT_all_N'; % unadjusted Theil
rthidx2=TT_all_N'+(athidx(1)-TT_all_N(1))'; % adjusted

% Axis
t31=linspace(1976,2006,31);
t30=linspace(1976,2005,30);
t29=linspace(1976,2004,29);
t21=linspace(1976,1996,21);


% Figures
subplot(3,1,1)
%figure
plot(t29,100*agdpg,'k',t21,100*rgdpg,'k--')
title('Growth Rate')
legend('Expected Path','Actual Data')
axis([1975,2005,0,15])

subplot(3,1,2)
%figure
plot(t30,afindp,'k',t21,rfindp,'k--')
title('Participation Rate')
legend('Expected Path','Actual Data')
axis([1975,2005,0,0.6])

subplot(3,1,3)
%figure
%plot(t30,athidx,'k',t30,uthidx,'k-.',t21,rthidx2,'k--',t21,rthidx,'k:')
plot(t30,athidx,'k',t21,rthidx2,'k--')
title('Theil Index')
axis([1975,2005,0,0.15])

%figure
%plot(t30,aginiadj,'k',t30,mginiadj,'k-.',t21,rgini,'k:')
%title('Gini')
%legend('Analytical','Monte Carlo','Actual Data')
