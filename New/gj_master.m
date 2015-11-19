function [result]= gj_master(x) %GJbet, GJdel, gam, GJq,GJsig) 
%function gj_master() %GJbet, GJdel, gam, GJq, GJTA, GJTB, GJEA, GJEB, GJsig)
%global GJbet GJdel gam GJq GJTA GJTB GJEA GJEB GJsig;

time_start =  clock();
disp(time_start);
%GJbet =0.96;
%GJdel = 1.03;
%gam= 0.98;
%GJq=7;
GJTA=1.047;
GJTB = 1.147;
GJEA = -0.6;
GJEB = 0.6;
%GJsig=1.;
parallel_mode = 1; %0, if single

%disp(nargin);
%if nargin<5 GJsig = 1; end
%if nargin<4 GJq = 5; end
%if nargin<3 gam=0.98; end
%if nargin<2 GJdel=1.054; end
%if nargin<1 GJbet=0.96; end
if nargin <1 x=[]; end
if length(x)<5 GJsig = 1;  else GJsig = x(5); end
if length(x)<4 GJq = 5;    else GJq = x(4); end
if length(x)<3 gam = 0.98; else gam = x(3); end
if length(x)<2 GJdel = 1.054; else GJdel = x(2); end
if length(x)<1 GJbet=0.96; else GJbet = x(1); end

policy_file = 'policy.mat';
hist_file = 'hist.mat';
temp_set = 'sim_';

%simplex estimation points
%est_points = 10;
%est_file = 'est.mat';

%number of Monte-Carlo simulations
sim_total = 3000;
sim_file = 'sim.mat';

criterion_file = 'criterion.csv';

%gj_start_est(est_points, est_file);
gj_main(policy_file, GJbet, GJdel, gam, GJq, GJTA, GJTB, GJEA, GJEB, GJsig);
gj_transition(policy_file, hist_file);

for i = 1:sim_total
    gj_simul(policy_file, strcat(temp_set,num2str(i, '%04d'),'.mat'));
end

gj_collect(sim_total, temp_set, sim_file);

crit=gj_xi(hist_file, sim_file, sim_total, criterion_file);

%select the best crit point 
%gj_best(hist_file, sim_file, policy_file, est_file);

%disp(crit);
time_end= etime(clock,time_start);
disp(time_end);
result = crit;

