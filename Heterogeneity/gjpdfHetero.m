% Constructing Initial Wealth Distribution

clear all;

% LOAD RAW DATA
                 
load kdataRur.csv -ascii; 
%load kdataUrb.csv -ascii; 
%load kdataLedu.csv -ascii; 
%load kdataHedu.csv -ascii; 

kdata2=kdataRur;
%kdata2=kdataUrb;
%kdata2=kdataLedu;
%kdata2=kdataHedu;

%load sesw76; % Aug 02 data: w76 column 1 is wealth (sorted), 2 is weight-Hyeok refined this.
             % this is annual one.
w76=[kdata2(kdata2(:,1)==1976,5) kdata2(kdata2(:,1)==1976,4)];
w76=sortrows(w76,1);

% MAKE DATA with BINS
% Log Data
%bins=800;   % for log
bins=1600;
incr=bins/40;           
wk =log(w76(:,1))*incr; % 1/1 scale
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

save gjpdlog76Rur pd76 cd76; 
%save gjpdlog76Urb pd76 cd76; 
%save gjpdlog76Ledu pd76 cd76; 
%save gjpdlog76Hedu pd76 cd76; 
