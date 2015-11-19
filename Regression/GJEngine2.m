function[joinBank,K]=GJEngine2(eta)

global J T tet GJkA GJkB K joinBank GJdel optsav CZK np GJAS GJAF GJq;

for j=1:J
	bank=joinBank(j,1);
	for t=1:T
		if bank==0
			if K(j,t)<CZK
				for ii=1:np+1
					SFTT(ii)=cos((ii-1)*acos(2*(K(j,t)-GJkA)/(GJkB-GJkA)-1));
				end
            sav=real(GJAS*SFTT');
				sav=min(0.9999,sav);
            fai=real(GJAF*SFTT');
				fai=max(0,fai);
				fai=min(1,fai);
				R=fai*eta(j,t)+(1-fai)*GJdel;
				K(j,t+1)=R*sav*K(j,t);
			else
				bank=bank+1;
				if tet(t)>GJdel;
                    R=tet(t);
  				else
					R=GJdel;
				end
				K(j,t+1)=R*optsav*(K(j,t)-GJq);
			end
		else
				if tet(t)>GJdel;
                    R=tet(t);
         		else
					R=GJdel;
				end
				K(j,t+1)=R*optsav*K(j,t);
		end
		joinBank(j,t+1)=bank;	
   end
end