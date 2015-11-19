function[mv]=mvave2(x,t)
% mvave2(x,t)
% Calculate t-year moving average of x, but not overlapping
% i.e., 1971-1980 data generates only two five year average data for 1971-1975, 1976-1980
% x should be JxT matrix, J# var, T#total periods
% By Kenichi Ueda 2003

[J,T]=size(x);
TT=floor(T/t);
mv=zeros(J,TT);
for k=1:TT
    m=mean(x(:,(k-1)*t+1:(k-1)*t+t)')';
    mv(:,k)=m;
end