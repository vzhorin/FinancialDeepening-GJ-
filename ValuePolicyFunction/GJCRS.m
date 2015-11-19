clear all;
diary kekkaCRSfin.log;
diary on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% program for Greenwood - Jovanovic model %
% by Kenichi Ueda                         %
% Dec. 6, 96                              %
% Revised October 6, 97                   %
% Use CRS utility funtion                 %
% Basically the same as GJmain1yr.m for   %
% log utility.                            %
% So, look at comments in there.          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global Faio GJTA GJTB GJEA GJEB GJq vq GJA GJkA GJkB GJnp l m sfa sfb;
global GJAv GJBv GJk GJKK GJKK2 GJKK3 GJKJ GJs GJf GJdel GJbet GJW GJv;
global h1 h2 h3 h4 f g SSS FFF VA GJsig WA;

	
%%%%%%%%%%%%%
% parameter %
%%%%%%%%%%%%%

GJsig = 1.5;
GJbet = 0.96;
GJdel = 1.054;
gam   = 1;
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

diary off

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
GJkB  = 20;	% (highest capital)
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

snu    = 9;  % (# of saving grids  default == 9)
fnu    = 11; % (# of portfolio share grids  default == 11)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% value function v for those who participate bank system %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ers1=(gam^(1-GJsig))/(GJTB-GJTA);
ers2=(GJdel^(1-GJsig))*(GJdel-GJTA);
ers3=( (GJTB^(2-GJsig)) - (GJdel^(2-GJsig)) )/(2-GJsig);
Ers = ers1*(ers2+ers3)         

optsav=(GJbet*(Ers))^(1/GJsig)
VA=((1-optsav)^(-GJsig))/(1-GJsig)

v = GJcrsv(GJk);
vq=zeros(1,n);
kq=GJk-GJq;
qi=asorder(kq,0);
vq(1:qi-1)=-1e10*ones(1,qi-1);
vq(qi:n)= GJcrsv(kq(qi:n));
GJv=v;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% value function w for nonparticipants %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (optimal policies for nonparticipants wo)

Ee=(GJTB+GJTA)/2;
if Ee<=GJdel
	Faio=0;
else
	Faio=fsolve('Gfaicrs',0.5);
end
if Faio>1;
	Faio=1;
end

Ere=quadlg('ere1',h1,h2)+quadlg('ere2',h2,h3)+quadlg('ere3',h3,h4);

optsav0=(GJbet*(Ere))^(1/GJsig)

WA=((1-optsav0)^(-GJsig))/(1-GJsig)

wo=GJcrsw0(GJk);

diary on
optsav
Faio
optsav0
diary off

% (initial value for z)
Tz=zeros(1,n);
GJA=ChebCoefAl('GJcrsw0',GJkA,GJkB,n,GJnp);
GJk=fliplr(GJk);
for j=1:n
	Tz(j)=ChebCoef('GJcrsw0',GJk(j),GJkA,GJkB,n,GJnp);
end
Tz=fliplr(Tz);
GJk=fliplr(GJk);

%hold on
%	plot(GJk,v,'c')
%	plot(GJk,vq,'r')
%	plot(GJk,wo,'y')
%	plot(GJk,Tz,'b')
%	axis([GJkA GJkB -500 0])
%hold off
%break


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Big loop for iterating w - coefficient GJA  %
% 1) Use Crit K to compute fast               %
% 2) Calculate W                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (initial value for controls of iteration)		
iterate=0;
Tdif=1;
dif=0;
sfdif=ones(1,n);
sf=ones(2,n);
sfconv=zeros(1,n);

bigiter=0;
GJZ=Tz;

while Tdif>0.01
tic
diary on
	bigiter=bigiter+1
	if bigiter>100 & Tdif>dif
		GJZ=GJZold;
		'Z is not converged.'
		break;
	end

	dif=Tdif		
diary off

	snx=floor((4+bigiter)/3);
	fnx=floor((4+bigiter)/3);
	sn=min(snx,snu);
	fn=min(fnx,fnu);
	sgrid = linspace(optsav,0.99,sn);
	fgrid = linspace(0,1,fn);

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% iteration with searching policy function %
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		% each k, maximize over policy (s,fai) by Simplex method  %
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
			Zsf(:,j)=[optsav 0]';
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
					valw(si,fi)=feval('GJZZcrs',sfpt);
				end
			end
			[MM,sindexvec]=min(valw);
			[TM,findex]=min(MM);
			%Tw(j)=-TM;
			sindex=sindexvec(findex);
			%sfj=[sgrid(sindex) fgrid(findex)]';
						
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
					valw(si,fi)=feval('GJZZcrs',sfpt);
				end
			end
			[MM,sindexvec]=min(valw);
			[TM,findex]=min(MM);
			%Tw(j)=-TM;
			sindex=sindexvec(findex);
			sfj=[ssgrid(sindex) ffgrid(findex)]';			

			% One more
			%IM=fmins('GJZZcrs',sfj);
            IM=sfj;
			sf(:,j)=IM;
			zw(j)=-GJZZcrs(IM);
			
			% Lower Bound
			Two=wo(j);
			if Two>zw(j)
				GJW(j)=Two;
				Wsf(:,j)=[optsav0 Faio]';
				d(j)=0;
			else
				GJW(j)=zw(j);
				Wsf(:,j)=sf(:,j);
			end			
		
				
			if KFORCED==1000
			% Optimal Participstion
				if GJW(j)<=vq(j)
					d(j)=1;
					Tz(j)=vq(j);
					Zsf(:,j)=[optsav 0]';
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
					Zsf(:,j)=[optsav 0]';
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
		%	plot(GJk,Tz,'b')
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
	Tdif=max(abs(GJZ-Tz)); % check convergence
	GJZold=GJZ;
	GJZ=Tz;
	GJA=TGJA;
toc
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
						sfpt=[sgrid(si) fgrid(fi)]';
						valw(si,fi)=feval('GJZZcrs',sfpt);
					end
				end
				[MM,sindexvec]=min(valw);
				[TM,findex]=min(MM);
				%Tw(j)=-TM;
				sindex=sindexvec(findex);
				%sfj=[sgrid(sindex) fgrid(findex)]';
							
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
						valw(si,fi)=feval('GJZZcrs',sfpt);
					end
				end
				[MM,sindexvec]=min(valw);
				[TM,findex]=min(MM);
				%Tw(j)=-TM;
				sindex=sindexvec(findex);
				sfj=[ssgrid(sindex) ffgrid(findex)]';			

				% One more
				%IM=fmins('GJZZcrs',sfj);
				IM=sfj;
                sf(:,j)=IM;
				zw(j)=-GJZZcrs(IM);
			
				% Lower Bound
				%if bigiter<4
				Two=wo(j);
				if Two>zw(j)
					GJW(j)=Two;
					Wsf(:,j)=[optsav0 Faio]';
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
						Zsf(:,j)=[optsav 0]';
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
						Zsf(:,j)=[optsav 0]';
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
	
save OUTCRSfin GJsig KFORCED CritK GJkA GJkB GJTA GJTB GJEA GJEB Wsf Zsf......
GJW GJZ d v vq wo GJk GJdel GJbet gam GJq GJA optsav optsav0 Faio;
