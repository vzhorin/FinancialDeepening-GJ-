% Constructing Initial Wealth Distribution

% Used for both analytical log evolution and Monte Carlo Level evolution
% Make different distribution for log and levels.

% Original gjpd76.mat is for [0,100,000] with 1/100 scale (100baht unit) 1000 bins.
% At bin 18 cd76=0.9389 and at bin 19 cd76=0.9444 so k*=1900 baht (6% rich people join).

% Original gjpdlog76.mat is for [0,exp(40)] with log scale 800 bins (with 1 bhat unit).

% In Aug 02 data, difference is from monthly*91.0842=annual data, and less inequality in Aug 02 data.

% July 05 data (kdata2.txt) is exactly the same as Aug 02 data except one household and negligible in pdf and cdf.

% In Level, gjpd76A2.mat for [0, 10,000,000] with 1/10000 scale (10000bhat unit) 1000 bins.
% At bin 21 cd76=0.9381 and at bin 22 cd76=0.9432 so k* is approximated at 220000 bhat (6% rich join).

% In Log, gjpd76A216.mat for [0,40] with 1/1 log scale 1600 bins.
% Represented at half point from [0.5,39.5]
% At bin 491 cd76=0.9400 so log(k*)=491/40, which is 12.451 in the grid with approximation error, 
% and so k* is approximated at exp(12.451)=255562 bhat.


clear all;


% LOAD RAW DATA

% load wk76.raw;  % Original one: column 1 is wealth (sorted), 2 is weight. 
                  % this is 100 baht unit, (actually monthly wealth with 91.0842 conversion to annual one)

% load GJ76_sim_se.raw; % For Hyeok in 2001, column 2 is wealth, 1 is weight, for simulation
% load GJ76_est_se.raw; % both are annual data, young only for estimation              
                  
%load sesw76; % Aug 02 data: w76 column 1 is wealth (sorted), 2 is weight-Hyeok refined this.
                % this is annual one.

load kdata2.csv -ascii;
w76=[kdata2(kdata2(:,1)==1976,5) kdata2(kdata2(:,1)==1976,4)];
w76=sortrows(w76,1);


% MAKE DATA with BINS
% FOR LEVEL DATA (Original Data for Three Year Term)
%bins =1000; % for level, more than this too much zig zags. incr=1, [42,33463]
%wk = wk76(:,1)/100; % scaled 1/100
%wk76 = [wk wk76(:,2)];

% FOR LOG DATA
%bins=800; % for log, 1600 too much zig zags.
%incr=bins/40; % for the upper k limit is exp(40), wk below possibly take exp(40) as maximum, 1/1 scale                  
%wk=log(wk76(:,1))*incr;  % for 800 bins 40*20 ([0,40] 800 bins 1/20 increment, 800/20=log(*) at max) 
%wk76 = [wk wk76(:,2)];   % linspace(0.5,39.5,800) is actually assigned in gjtransLog.m               

% USED FOR Hyeok in 2001
%wk = GJ76_sim_se(:,2)/10000; % because [0-3047916] 1000 bins
%wk76 = [wk GJ76_sim_se(:,1)];
%wk = GJ76_est_se(:,2)/10000; % because [0-3047916] 1000 bins 
%wk76 = [wk GJ76_est_se(:,1)];

% FOR AUG 02 DATA (Annual Data) and JULY 05 DATA


% Level Data
%bins = 1000;      % for level, [175,3945345] 1000 bins
%wk = w76(:,1)/10000; % scaled 1/10000 -> width is 10000 bhat
%wk76 = [wk w76(:,2)];

% Log Data
%bins=800;   % for log
bins=1600;
incr=bins/40;           
wk =log(w76(:,1))*incr; % 1/1 scale to put in [0,40]
wk76 = [wk w76(:,2)];                  

% FOR MAKING CDF/PDF

[nr,nc]=size(wk76);

for j=1:bins
z=0;
for i=1:nr
if wk76(i,1)< j	% 1 bahts unit column 2, log scale
	y(j)=z+wk76(i,2);
	z=y(j);
end
end
end
cd76=y./y(bins);
pd=zeros(1,bins);
pd76(1)=cd76(1);
for j=2:bins
	pd76(j)=cd76(j)-cd76(j-1);
end

%save gjpd76 pd76 cd76; % Oroginal Level
%save gjpdlog76 pd76 cd76; % Original Log
%save gjpd76Hall pd76 cd76; % Hyeok 01 Level
%save gjpd76A2 pd76 cd76; % Aug 02 Data Level
%save gjpdlog76A2 pd76 cd76; % Aug 02 Data Log 800 bin
save gjpdlog76A216 pd76 cd76; % Aug 02 Data Log 1600 bin sesw76 based
%save gjpdlog76kdata2 pd76 cd76; % July 05 Log 1600 bin kdata based

break

% FOR 1996 DATA

%load wk96.raw;
%wk=log(wk96(:,1))*incr;  % for 800 bins 40*20 ([0,40] 800 bins 1/20 increment)
%wk96 = [wk wk96(:,2)];                  

%[nr,nc]=size(wk96);

%for j=1:bins
%z=0;
%y(1)=0;
%for i=1:nr
%if wk96(i,1)< j
%	y(j)=z+wk96(i,2);
%	z=y(j);
%end
%end
%end
%cd96=y./y(bins);
%pd=zeros(1,bins);
%pd96(1)=cd96(1);
%for j=2:bins
%	pd96(j)=cd96(j)-cd96(j-1);
%end
%save gjpdlog96 pd96 cd96;