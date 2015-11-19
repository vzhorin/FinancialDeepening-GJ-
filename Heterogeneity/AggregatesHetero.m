clear all;

load kdataRur.csv -ascii;
%load kdataUrb.csv -ascii;
%load kdataLedu.csv -ascii;
%load kdataHedu.csv -ascii;


kdata2=kdataRur;
%kdata2=kdataUrb;
%kdata2=kdataLedu;
%kdata2=kdataHedu;

yrs=[1976,1981,1986,1988,1990,1992,1994,1996];
t = [77,78,79,80,82,83,84,85,87,89,91,93,95];

for i=1:length(yrs)
    
    % Average Income in Thai for all population
    wtp = kdata2(kdata2(:,1)==yrs(i),4);
    sumw=sum(wtp);
    W= wtp/sumw;
    sesinc = kdata2(kdata2(:,1)==yrs(i),7);
    AI(i) = sum(sesinc.*W);
    
    % Theil indices
    N(i) = length(sesinc);
    %t_all_T(i)=log(AI(i))-sum(W.*log(sesinc)); %for E(0) Thiel L
    
    x=sesinc./AI(i);
    t_all_T(i)=sum(W.*x.*log(x)); %for E(1) Theil T
    
    % Financial Participation
    dbank=kdata2(kdata2(:,1)==yrs(i),3);
    sumdb(i)=100*sum(dbank.*W);
end

% Normalized Theil
t_all_N = t_all_T./log(N);

for i=2:length(yrs)
    gtn(i) = ((t_all_N(i)/t_all_N(i-1))^(1/(yrs(i)-yrs(i-1))))-1;
    gtf(i) = ((sumdb(i)/sumdb(i-1))^(1/(yrs(i)-yrs(i-1))))-1;
end

TT_all_N = [t_all_N(1) t_all_N(1)*(1+gtn(2)) t_all_N(1)*(1+gtn(2))^2 t_all_N(1)*(1+gtn(2))^3 t_all_N(1)*(1+gtn(2))^4 t_all_N(2) t_all_N(2)*(1+gtn(3)) t_all_N(2)*(1+gtn(3))^2 t_all_N(2)*(1+gtn(3))^3 t_all_N(2)*(1+gtn(3))^4 t_all_N(3) t_all_N(3)*(1+gtn(4)) t_all_N(4) t_all_N(4)*(1+gtn(5)) t_all_N(5) t_all_N(5)*(1+gtn(6)) t_all_N(6) t_all_N(6)*(1+gtn(7)) t_all_N(7) t_all_N(7)*(1+gtn(8)) t_all_N(8)];
part = [sumdb(1) sumdb(1)*(1+gtf(2)) sumdb(1)*(1+gtf(2))^2 sumdb(1)*(1+gtf(2))^3 sumdb(1)*(1+gtf(2))^4 sumdb(2) sumdb(2)*(1+gtf(3)) sumdb(2)*(1+gtf(3))^2 sumdb(2)*(1+gtf(3))^3 sumdb(2)*(1+gtf(3))^4 sumdb(3) sumdb(3)*(1+gtf(4)) sumdb(4) sumdb(4)*(1+gtf(5)) sumdb(5) sumdb(5)*(1+gtf(6)) sumdb(6) sumdb(6)*(1+gtf(7)) sumdb(7) sumdb(7)*(1+gtf(8)) sumdb(8)]';

save thaidatRur TT_all_N part;
%save thaidatUrb TT_all_N part;
%save thaidatLedu TT_all_N part;
%save thaidatHedu TT_all_N part;