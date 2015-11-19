function[z]=Thaieps2(lt)

global tetrang epsilon del grinc part summer;

ut=lt+tetrang;

R=Rtheta(lt,ut,del);
muplus=0.004;   %0.005
fai=0.3;        %0.3

oldpart=part(1:20);
curpart=part(2:21);
newpart=curpart-oldpart;

y = 0.96*R*oldpart + (0.96+muplus)*(fai*(lt+ut)/2 + (1-fai)*del)*(summer-curpart)...
    + 0.96*R*((15-5)/15)*newpart - summer - grinc(2:21)/100 ;


z=mean(y.^2); % mean squared error of simle forecast from actual Thai growth rate