function[GJAS,GJAF]=Zsffun(Wsf,snp);
% calculate coefficient of 
% savings and portoflio share by Chebyshev polynomial

n=100;

for j=1:n
	x(j)=cos(pi*(2*j-1)/(2*n));
	for i=1:snp+1
		T(j,i)=cos((i-1)*acos(x(j)));
	end
end

S=Wsf(1,:);
F=Wsf(2,:);
FTS=fliplr(S);
GJAS=((T'*T)\(T'*FTS'))';
FTF=fliplr(F);
GJAF=((T'*T)\(T'*FTF'))';


% To get policies everywhere calculate as follows
%	(at K)
%	for ii=1:np+1
%			SFTT(ii)=cos((ii-1)*acos(2*(K-GJkA)/(GJkB-GJkA)-1));
%	end
%	sav=GJAS*SFTT';
%	fai=GJAF*SFTT';

