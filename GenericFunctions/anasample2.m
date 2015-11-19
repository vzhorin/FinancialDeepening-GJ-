function[y]=anasample2(pdf,ini,wid,n);

% anasample2(pdf,ini,wid,n)
% given (analytical) pdf vector and sample number n, make sample y
% several people according to pdf and n have the same wealth.
% ini is initial value of pdf, wid is increment.
% The size is relative. So, 'ini=5 with wid=10' gives the same dist. as
% 'ini=50 with wid 100'. Need to calculate the scale.
% sample number can be different from n. it is given by length(y)
% By Kenichi Ueda originally developed in 1997.
% some density will be assigned zero people before recording positive again-fixed 8/8/02

m=length(pdf);
npd=round(pdf*n);
yn=sum(npd);      % Total sample number
y=zeros(1,yn);		% entry for each yn number of people
nk=npd(1);
y(1:nk)=ini*ones(1,nk); % First nk people has lowest wealth
bigi=npd(1);
for j=2:m
	%if npd(j)==0
	%	break
    %end
	wk=ini+wid*(j-1);		% Second npd(2)-bigi(npd(1)) people has wk wealth
	y(bigi+1:bigi+npd(j))=wk*ones(1,npd(j));
	bigi=bigi+npd(j);
end
