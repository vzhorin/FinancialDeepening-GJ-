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


load mexico_wealth_young_before.csv;
wealth=sortrows(mexico_wealth_young_before,1)/1000; %scale in thousands pesos


% Log Data
bins=1000;
incr=(log(max(wealth))-log(min(wealth)))/bins;           
log_wealth =log(wealth(:));                 

% FOR MAKING CDF/PDF
wk = [log_wealth wealth];
nr=size(log_wealth);

for j=1:bins
cc=find(log_wealth(:,1)< j*incr);
y(j) = sum(wealth(cc));
end
cd=y./y(bins);

pd(1)=cd(1);
for j=2:bins
	pd(j)=cd(j)-cd(j-1);
end

bin_size = incr;

save gj_mexico_log_bansefi pd cd bin_size; % save log