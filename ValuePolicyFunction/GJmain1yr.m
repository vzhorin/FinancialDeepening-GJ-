clear all;
%tic
diary kekkaHMTC.log

% Not Restrict
% tec1d: same as tec1 except epsilon +-0.08
% [0,20] grid b/c k* > 10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% program for Greenwood - Jovanovic model %
% by Kenichi Ueda                         %
% First version, 12/6/96	              %
% Use Z funtion, 7/29/97                  %
% After trying Newton in GJnew6, turs out %
% This GJnew5 is best, replicate former   %
% result.  So stick this.                 %
% Real Parameters and 1000yrs to go,      %
%  GJnew5, 1/30/99                        %
% Make initial guess right,               %
%  GJnew20, 2/21/99                       %
% GJnew20.m yori name change, 4/23/99     %
% First iterate on savings only, 8/20/99  %
% Iterate at each policy sf, 8/21/99      %
% This is the same as AT46 (fix typo)     %
%     12/29/99                            %
% Same as GJmain in locke machine         %
% Finess of grid over maximization and    %
% use of simplex method are options       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%
% parameter %
%%%%%%%%%%%%%

global Faio GJTA GJTB GJEA GJEB GJq vq GJA GJkA GJkB GJnp l m sfa sfb;
global GJAv GJBv GJk GJKK GJKK2 GJKK3 GJKJ GJs GJf GJdel GJbet GJW GJv;
global h1 h2 h3 h4 f g SSS FFF IAB;



% (basics)
GJbet = 0.96;
GJdel = 1.054;
gam   = 0.98;
GJq   = 5;
KFORCED=1000; % (if optimal participation then set =1000) 
CritK=KFORCED;
GJbet
GJdel
GJq

% (stocastic part - use uniform)
GJTA  = 1.047;
GJTB  = 1.147;
GJEA  = -0.6;
GJEB  = 0.6;
[GJTA GJTB]
[GJEA GJEB]



h1    = GJTA+GJEA;
h4    = GJTB+GJEB;
if (GJTB-GJTA) >= (GJEB-GJEA)
	f     = GJTB-GJTA;
	g     = GJEB-GJEA; 
	h2    = GJTA+GJEB;
	h3    = GJTB+GJEA;
else
	g     = GJTB-GJTA;
	f     = GJEB-GJEA;
	h3    = GJTA+GJEB;
	h2    = GJTB+GJEA;
end	


% (initial parameters of approximation of w)
n     = 100; % (# of data points)
GJkA  = 0.1;	% (lowest caital)
GJkB  = 50;	% (highest capital) 20 for benchmark, 50 for  EP & SA & HMTC
GJnp  = 64;  % (# of polynomials = GJnp+1)

for j=1:n
	x(j)=cos(pi*(2*j-1)/(2*n));
	GJk(j) = (x(j)+1)*((GJkB-GJkA)/2) + GJkA; % (capital grid)
	for i=1:GJnp+1
		T(j,i)=cos((i-1)*acos(x(j)));
	end
end
GJk=fliplr(GJk);


% (parameters on policy optimization)
sfa   = [GJbet 0]';
sfb   = [1 1]';

sfA   = [GJbet 1]';
sfB   = [1 0]';

snu    = 9;  % (# of saving grids -> used at least twice to get finer grid)
fnu    = 11; % (# of portfolio share grids -> used at least twice to get finer grid)

diary off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% value function v for those who participate bank system %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		
Elnr=(1/(GJTB-GJTA))*((GJdel-GJTA)*log(gam*GJdel).....
		+(GJTB*log(gam*GJTB)-GJTB)-(GJdel*log(gam*GJdel)-GJdel));

GJAv = log(1-GJbet) / (1-GJbet) + GJbet*(log(GJbet)) / ((1-GJbet)^2);
GJBv = (GJbet/((1-GJbet)^2))*Elnr;
GJCv = log(GJk)/(1-GJbet);
v    = (GJAv+GJBv)*ones(1,n) + GJCv;
for j=1:n
	kq(j) = GJk(j)-GJq;
	if kq(j)>0;
		Cvq(j)=log(kq(j))/(1-GJbet);
	else
		Cvq(j)=-1e16;
	end
end	
vq   = (GJAv+GJBv)*ones(1,n) + Cvq;
GJv=v;	


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% value function w for nonparticipants %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (value of fai for nonparticipants wo)
delinv=1/GJdel;

A1=((h2-h1)-h1*(log(h2)-log(h1)))/(f*g);
A2=(log(h3)-log(h2))/f;
A3=(-(h4-h3)+h4*(log(h4)-log(h3)))/(f*g);
Eeinv=A1+A2+A3;

Ee=(GJTB+GJTA)/2;

if Ee<=GJdel
	Faio=0;
elseif Eeinv<delinv
	Faio=1;
else
	Faio=fsolve('Gfai',0.7);
end

diary on
Faio

if Faio == 1
   'Faio is one.'
end


diary off

%break


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First set phi=Faio, portfolio choise equal to that of Wo (never joiners)      %
% and iterate by maximizing with saving decision only to get closer approximate %
% of final value function---to use the costly two dimensional optimization only %
% for the last fine tuning.   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (initial function)
x1=log(GJkA);
y1=gjWo(GJkA);
x2=log(GJkB);
y2=gjV(GJkB-GJq);
inix=[x1 1;x2 1];
iniy=[y1;y2];
IAB=inix\iniy;

% (initial value for z)
Tz=zeros(1,n);
GJA=ChebCoefAl('gjInifun',GJkA,GJkB,n,GJnp);
GJk=fliplr(GJk);
GJf=1;
GJs=GJbet;
sfwo=[GJs GJf]'; %'
 
for j=1:n
	Tz(j)=ChebCoef('gjInifun',GJk(j),GJkA,GJkB,n,GJnp);
end
Tz=fliplr(Tz);
GJk=fliplr(GJk);
wo=gjWo(GJk);

%hold on
%	plot(GJk,v,'ko')
%	plot(GJk,vq,'k+')
%	plot(GJk,wo,'k*')
%	plot(GJk,Tz,'k-')
%	axis([GJkA GJkB -30 30])
%hold off
%break


% (initial value for controls of iteration)		
iterate=0;
Tdif=1;
dif=0;
sfdif=ones(1,n);
sf=ones(2,n);
sfconv=zeros(1,n);

bigiter=0;
GJZ=Tz;
while Tdif>0.1
diary on
	bigiter=bigiter+1	
	if bigiter>4 & Tdif>dif
		GJZ=GJZold;
		'Z is not converged.'
		break;
	end
       	dif=Tdif;		
diary off

	snx=floor((4+bigiter)/3);
	sn=min(snx,snu);
	sgrid = linspace(GJbet,0.999,sn);

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% iteration with searching policy function %
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		% each k, maximize over savings only. Can use Simplex method (fmins) %
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

		for j=1:n	
			%tic
			%[bigiter j] % check it works
		
			GJKJ=GJk(j);
			if KFORCED==1000
				CCKK=CritK+1;
			else
				CCKK=KFORCED;
			end
			if GJKJ>=CCKK
				d(j)=1;
				Tz(j)=vq(j);
				Zsf(:,j)=[GJbet 0]';
				if j>1
					if d(j)>d(j-1)
						CritK=GJKJ;
					end
				end
			else
	
				% Grid search--porfolio choice is set at Faio
				for si=1:sn
				     
						sfpt=[sgrid(si) Faio]';
						valw(si)=feval('GJZZ',sfpt);
					
				end
				[MM,sindex]=min(valw);
											
				% One more
				if sindex>1
					saa=sgrid(sindex-1);
				else
					saa=sgrid(sindex);
				end
				if sindex<sn
					sbb=sgrid(sindex+1);
				else
					sbb=sgrid(sindex);
				end
				
				ssgrid=linspace(saa,sbb,sn);
				
				for si=1:sn
				
						sfpt=[ssgrid(si) Faio]';
						valw(si)=feval('GJZZ',sfpt);
				
				end
				[MM,sindex]=min(valw);
				sfj=[ssgrid(sindex) Faio]';			

				% One more
				%IM=fmins('GJZZ',sfj);
				%sf(:,j)=IM;
				sf(:,j)=sfj;
                zw(j)=-GJZZ(sfj);
			
				% Lower Bound
				%if bigiter<4
				Two=wo(j);
				if Two>zw(j)
					GJW(j)=Two;
					Wsf(:,j)=[GJbet Faio]';  %'
					d(j)=0;
				else
					GJW(j)=zw(j);
					Wsf(:,j)=sf(:,j);
				end
				
				%end
				
				if KFORCED==1000
				% Optimal Participstion
				if GJW(j)<=vq(j)
					d(j)=1;
					Tz(j)=vq(j);
					Zsf(:,j)=[GJbet 0]'; %'
					if j>1
						if d(j)>d(j-1)
							CritK=GJKJ;
						end
					end

				else
					d(j)=0;
					Tz(j)=GJW(j);
					Zsf(:,j)=Wsf(:,j);
				end
				else
				% Forced Participstion
				if GJKJ>KFORCED
					d(j)=1;
					Tz(j)=vq(j);
					Zsf(:,j)=[GJbet 0]'; %'
					if j>1
						if d(j)>d(j-1)
							CritK=GJKJ;
						end
					end
				else
					d(j)=0;
					Tz(j)=GJW(j);
					Zsf(:,j)=Wsf(:,j);
				end
				end
				
			end
		%toc
		end
		
		%hold on
		%	plot(GJk,Tz,'k-')
		%hold off

		%if bigiter == 1		
		%	vstep=1;
		%elseif bigiter<=10
		%	vstep=1 - (0.1*(bigiter-1));
		%end
		
      %Tz=vstep*Tz + (1-vstep)*GJZ;
      FTz=fliplr(Tz);

	%%%%%%%%%%%%%%%%%%%%%%%%%%
	% update parameters of w %
	%%%%%%%%%%%%%%%%%%%%%%%%%%
	TGJA=((T'*T)\(T'*FTz'))';
diary on
	Tdif=max(abs(GJZ-Tz)) % check convergence
diary off
	GJZold=GJZ;
	GJZ=Tz;
	GJA=TGJA;
	
	if Tdif <= 0.1
	    break;
	end
        if CritK == 1000
	    break;
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% Iterate to get consistent Value function at each given policies, %
	% savings/portfolio choice before searching next policy function   %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
	TTdif=1;
  
        if Tdif<=0.1;
                 while TTdif>0.1
	                 for j=1:n
				zw(j)=-GJZZ(sfj);
			
				% Lower Bound
				%if bigiter<4
				Two=wo(j);
				if Two>zw(j)
					GJW(j)=Two;
					Wsf(:,j)=[GJbet Faio]';  %'
					d(j)=0;
				else
					GJW(j)=zw(j);
					Wsf(:,j)=sf(:,j);
				end
				
				%end
				
				if KFORCED==1000
				% Optimal Participstion
				if GJW(j)<=vq(j)
					d(j)=1;
					Tz(j)=vq(j);
					Zsf(:,j)=[GJbet 0]'; %'
					if j>1
						if d(j)>d(j-1)
							CritK=GJKJ;
						end
					end

				else
					d(j)=0;
					Tz(j)=GJW(j);
					Zsf(:,j)=Wsf(:,j);
				end
				else
				% Forced Participstion
				if GJKJ>KFORCED
					d(j)=1;
					Tz(j)=vq(j);
					Zsf(:,j)=[GJbet 0]'; %'
					if j>1
						if d(j)>d(j-1)
							CritK=GJKJ;
						end
					end
				else
					d(j)=0;
					Tz(j)=GJW(j);
					Zsf(:,j)=Wsf(:,j);
				end
				end
				
			end
		%Tz=vstep*Tz + (1-vstep)*GJZ;
                FTz=fliplr(Tz);

        	%%%%%%%%%%%%%%%%%%%%%%%%%%
	        % update parameters of w %
        	%%%%%%%%%%%%%%%%%%%%%%%%%%
	        TGJA=((T'*T)\(T'*FTz'))';
	        TTdif=max(abs(GJZ-Tz)); % check convergence
	        GJZold=GJZ;
	        GJZ=Tz;
	        GJA=TGJA;
		end
        end     
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Now the fine tuning, optimizing over both savings and portfolio choice. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (initial value for controls of iteration)		
iterate2=0;
Tdif=1;
dif=0;
bigiter2=0;

while Tdif>0.01
diary on
	bigiter2=bigiter2+1	
	%if bigiter2>4 & Tdif>dif
	%	GJZ=GJZold;
	%	'Z is not converged.'
	%	break;
	%end
       	dif=Tdif;		
diary off

	sn=snu;
	fn=fnu;
	sgrid = linspace(GJbet,0.999,sn);
	fgrid = linspace(0,1,fn);

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% iteration with searching policy function %
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		% each k, maximize over both policies (s,fai), can use Simplex method (fmins) %
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

		for j=1:n	
			%tic
			%[bigiter2 j] % check it works
		
			GJKJ=GJk(j);
			if KFORCED==1000
				CCKK=CritK+1;
			else
				CCKK=KFORCED;
			end
			if GJKJ>=CCKK
				d(j)=1;
				Tz(j)=vq(j);
				Zsf(:,j)=[GJbet 0]';
				if j>1
					if d(j)>d(j-1)
						CritK=GJKJ;
					end
				end
			else
	
				% Grid search
				for si=1:sn
					for fi=1:fn
						sfpt=[sgrid(si) fgrid(fi)]';
						valw(si,fi)=feval('GJZZ',sfpt);
					end
				end
				[MM,sindexvec]=min(valw);
				[TM,findex]=min(MM);
				%Tw(j)=-TM;
				sindex=sindexvec(findex);
				%sfj=[sgrid(sindex) fgrid(findex)]'; %'
							
				% One more
				if sindex>1
					saa=sgrid(sindex-1);
				else
					saa=sgrid(sindex);
				end
				if findex>1	
					faa=fgrid(findex-1);
				else
					faa=fgrid(findex);
				end
				if sindex<sn
					sbb=sgrid(sindex+1);
				else
					sbb=sgrid(sindex);
				end
				if findex<fn
					fbb=fgrid(findex+1);
				else
					fbb=fgrid(findex);
				end

				ssgrid=linspace(saa,sbb,sn);
				ffgrid=linspace(faa,fbb,fn);

				for si=1:sn
					for fi=1:fn
						sfpt=[ssgrid(si) ffgrid(fi)]';
						valw(si,fi)=feval('GJZZ',sfpt);
					end
				end
				[MM,sindexvec]=min(valw);
				[TM,findex]=min(MM);
				%Tw(j)=-TM;
				sindex=sindexvec(findex);
				sfj=[ssgrid(sindex) ffgrid(findex)]';			

				% One more
				%IM=fmins('GJZZ',sfj);
				%sf(:,j)=IM;
				%zw(j)=-GJZZ(IM);
                sf(:,j)=sfj;
			    zw(j)=-GJZZ(sfj);
                
				% Lower Bound
				%if bigiter2<4
				Two=wo(j);
				if Two>zw(j)
					GJW(j)=Two;
					Wsf(:,j)=[GJbet Faio]';  %'
					d(j)=0;
				else
					GJW(j)=zw(j);
					Wsf(:,j)=sf(:,j);
				end
				
				%end
				
				if KFORCED==1000
				% Optimal Participstion
				if GJW(j)<=vq(j)
					d(j)=1;
					Tz(j)=vq(j);
					Zsf(:,j)=[GJbet 0]'; %'
					if j>1
						if d(j)>d(j-1)
							CritK=GJKJ;
						end
					end

				else
					d(j)=0;
					Tz(j)=GJW(j);
					Zsf(:,j)=Wsf(:,j);
				end
				else
				% Forced Participstion
				if GJKJ>KFORCED
					d(j)=1;
					Tz(j)=vq(j);
					Zsf(:,j)=[GJbet 0]'; %'
					if j>1
						if d(j)>d(j-1)
							CritK=GJKJ;
						end
					end
				else
					d(j)=0;
					Tz(j)=GJW(j);
					Zsf(:,j)=Wsf(:,j);
				end
				end
				
			end
		%toc
		end
		
		%hold on
		%	plot(GJk,Tz,'k-')
		%hold off

		%if bigiter == 1		
		%	vstep=1;
		%elseif bigiter<=10
		%	vstep=1 - (0.1*(bigiter-1));
		%end
		
      %Tz=vstep*Tz + (1-vstep)*GJZ;
      FTz=fliplr(Tz);

	%%%%%%%%%%%%%%%%%%%%%%%%%%
	% update parameters of w %
	%%%%%%%%%%%%%%%%%%%%%%%%%%
	TGJA=((T'*T)\(T'*FTz'))';
diary on
	Tdif=max(abs(GJZ-Tz)) % check convergence
diary off
	GJZold=GJZ;
	GJZ=Tz;
	GJA=TGJA;

	if Tdif <= 0.01
	    break;
	end


        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Get consistent Value function at each given policies (s, fai) %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	TTdif=1;
  
        if Tdif<0.01;
                 while TTdif>0.01
	                 for j=1:n
				zw(j)=-GJZZ(sfj);
			
				% Lower Bound
				%if bigiter<4
				Two=wo(j);
				if Two>zw(j)
					GJW(j)=Two;
					Wsf(:,j)=[GJbet Faio]';  %'
					d(j)=0;
				else
					GJW(j)=zw(j);
					Wsf(:,j)=sf(:,j);
				end
				
				%end
				
				if KFORCED==1000
				% Optimal Participstion
				if GJW(j)<=vq(j)
					d(j)=1;
					Tz(j)=vq(j);
					Zsf(:,j)=[GJbet 0]'; %'
					if j>1
						if d(j)>d(j-1)
							CritK=GJKJ;
						end
					end

				else
					d(j)=0;
					Tz(j)=GJW(j);
					Zsf(:,j)=Wsf(:,j);
				end
				else
				% Forced Participstion
				if GJKJ>KFORCED
					d(j)=1;
					Tz(j)=vq(j);
					Zsf(:,j)=[GJbet 0]'; %'
					if j>1
						if d(j)>d(j-1)
							CritK=GJKJ;
						end
					end
				else
					d(j)=0;
					Tz(j)=GJW(j);
					Zsf(:,j)=Wsf(:,j);
				end
				end
				
			end
		%Tz=vstep*Tz + (1-vstep)*GJZ;
                FTz=fliplr(Tz);

        	%%%%%%%%%%%%%%%%%%%%%%%%%%
	        % update parameters of w %
        	%%%%%%%%%%%%%%%%%%%%%%%%%%
	        TGJA=((T'*T)\(T'*FTz'))';
	        TTdif=max(abs(GJZ-Tz)); % check convergence
	        GJZold=GJZ;
	        GJZ=Tz;
	        GJA=TGJA;
		end
        end

save OUT1s Faio KFORCED CritK GJkA GJkB GJTA GJTB GJEA GJEB Wsf Zsf GJW GJZ d v vq wo GJk GJdel GJbet gam GJq GJA;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% One more to retrieve GJW and Wsf %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for j=1:n
	%tic
	%j
	GJKJ=GJk(j);

	% Grid search
				for si=1:sn
					for fi=1:fn
						sfpt=[sgrid(si) fgrid(fi)]'; %'
						valw(si,fi)=feval('GJZZ',sfpt);
					end
				end
				[MM,sindexvec]=min(valw);
				[TM,findex]=min(MM);
				%Tw(j)=-TM;
				sindex=sindexvec(findex);
				%sfj=[sgrid(sindex) fgrid(findex)]'; %'
							
				% One more
				if sindex>1
					saa=sgrid(sindex-1);
				else
					saa=sgrid(sindex);
				end
				if findex>1	
					faa=fgrid(findex-1);
				else
					faa=fgrid(findex);
				end
				if sindex<sn
					sbb=sgrid(sindex+1);
				else
					sbb=sgrid(sindex);
				end
				if findex<fn
					fbb=fgrid(findex+1);
				else
					fbb=fgrid(findex);
				end

				ssgrid=linspace(saa,sbb,sn);
				ffgrid=linspace(faa,fbb,fn);

				for si=1:sn
					for fi=1:fn
						sfpt=[ssgrid(si) ffgrid(fi)]'; %'
						valw(si,fi)=feval('GJZZ',sfpt); 
					end
				end
				[MM,sindexvec]=min(valw);
				[TM,findex]=min(MM);
				%Tw(j)=-TM;
				sindex=sindexvec(findex);
				sfj=[ssgrid(sindex) ffgrid(findex)]'; %'			

				% One more
				%IM=fmins('GJZZ',sfj);
				%sf(:,j)=IM;
				%zw(j)=-GJZZ(IM);
                sf(:,j)=sfj;
			    zw(j)=-GJZZ(sfj);
                    
				% Lower Bound
				%if bigiter<4
				Two=wo(j);
				if Two>zw(j)
					GJW(j)=Two;
					Wsf(:,j)=[GJbet Faio]'; %'
					d(j)=0;
				else
					GJW(j)=zw(j);
					Wsf(:,j)=sf(:,j);
				end
				
				%end
				
				if KFORCED==1000
					% Optimal Participstion
					if GJW(j)<=vq(j)
						d(j)=1;
						Tz(j)=vq(j);
						Zsf(:,j)=[GJbet 0]'; %'
						if j>1
							if d(j)>d(j-1)
								CritK=GJKJ;
							end
						end

					else
						d(j)=0;
						Tz(j)=GJW(j);
						Zsf(:,j)=Wsf(:,j);
					end
				else
					% Forced Participstion
					if GJKJ>KFORCED
						d(j)=1;
						Tz(j)=vq(j);
						Zsf(:,j)=[GJbet 0]'; %'
						if j>1 
							if d(j)>d(j-1)
								CritK=GJKJ;
							end
						end
					else
						d(j)=0;
						Tz(j)=GJW(j);
						Zsf(:,j)=Wsf(:,j);
					end
				end
		%toc		
			
end
		
		hold on
			plot(GJk,Tz,'k-')
		hold off

		%if bigiter == 1		
		%	vstep=1;
		%elseif bigiter<=10
		%	vstep=1 - (0.1*(bigiter-1));
		%end
		
      %Tz=vstep*Tz + (1-vstep)*GJZ;
      FTz=fliplr(Tz);

	%%%%%%%%%%%%%%%%%%%%%%%%%%
	% update parameters of w %
	%%%%%%%%%%%%%%%%%%%%%%%%%%
	TGJA=((T'*T)\(T'*FTz'))';
	Tdif=max(abs(GJZ-Tz)) % check convergence
	GJZold=GJZ;
	GJZ=Tz;
	GJA=TGJA;
	
GJsig=1; % Just add GJsig=1 for this log utility case to be consistent with other CRRA utility.


save OUTHMTC Faio KFORCED GJsig CritK GJkA GJkB GJTA GJTB GJEA GJEB Wsf Zsf GJW GJZ d v vq wo GJk GJdel GJbet gam GJq GJA;
%toc
diary off