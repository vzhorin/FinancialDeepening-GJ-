clear;
% Benchmark
%load HIST7ku;

% Sensitivity Analysis RES final version --> Need to load OUTfiles below twice
%load HISTHC; % Alternative, Higher Agg Mean Return
%load HISTEP; % Lower Variance of Idiosyncratic Shocks
%load HISTSA; % Higher Return of Safe Asset
%load HIST17; % Larger Variance in Agg Shock
%load HISTCRSfin; % Higher Risk Aversion
load HISTHMTC; % Higher Marginal Cost

%load thaidat2;
%load thaidat3k;
load thaigro;
load thaidat5T2;

afindp=H;
agdpg=100*(Allgrowk-1);
athidx=Theil;

rfindp=part/100;
rgdpg=grinc;

% Correct approx error b/w analytical and raw data
%load GJMagg7C;
%uthidx=uthidx*40/41;
load SimCond7;
xthidxL=Theil;
uthidxL=mean(xthidxL);

rthidx=TT_all_N+(uthidxL(1)-TT_all_N(1));

%mginiadj=mgini-(mgini(1)-rgini(1));
%aginiadj=agini-(agini(1)-rgini(1));


t31=linspace(1976,2006,31);
t30=linspace(1976,2005,30);
t29=linspace(1976,2004,29);
t21=linspace(1976,1996,21);

subplot(3,2,2)
%figure
plot(t29,agdpg/100,'k',t21,rgdpg/100,'k--')
title('Growth Rate')
legend('Expected Path','Actual Data')
axis([1975,1997,0,0.15])

subplot(3,2,4)
%figure
plot(t30,afindp,'k',t21,rfindp,'k--')
title('Participation Rate')
%legend('Analytical','Actual Data')
axis([1975,1997,0.05,0.3])

subplot(3,2,6)
%figure
plot(t30,athidx,'k',t21,rthidx,'k--')
title('Theil Index')
xlabel('Period')
axis([1975,1997,0.06,0.12])

%figure
%plot(t30,aginiadj,'k',t30,mginiadj,'k-.',t21,rgini,'k:')
%title('Gini')
%legend('Analytical','Monte Carlo','Actual Data')

clear;

load GJ_out;
subplot(3,2,1)
hold on
plot(GJk,Wsf(1,:),'k:')
clear;

% Need to chage OUTfiles here also below one more time
%load OUTHC
%load OUTEP;
%load OUTSA;
%load OUTnew17;
%load OUTCRSfin;
load GJ_out;

optsav=GJbet; % if log
plot(GJk,Wsf(1,:),'k')
title('Savings Rate')
%xlabel('capital')
%legend('Benchmark','Lower Var(\epsilon)') %EP
legend('Benchmark','Higher Safe Return') %SA
axis([GJkA GJkB 0.94 0.99])
%xlabel('wealth (model unit)')
text(CritK,0.945,['k^{*}=',num2str(round(CritK*10)/10)])
clear;

load GJ_out;
subplot(3,2,3)
hold on
plot(GJk,Wsf(2,:),'k:')
clear;

% Need to change this OUTfiles
%load OUTHC;
%load OUTEP;
%load OUTSA;
%load OUTnew17;
%load OUTCRSfin;
load GJ_out;

plot(GJk,Wsf(2,:),'k')
title('Portfolio Share')
xlabel('wealth (model unit)')
axis([GJkA GJkB 0 1])
%text(CritK,0.1,['k^{*}=',num2str(round(CritK*10)/10)])
hold off
