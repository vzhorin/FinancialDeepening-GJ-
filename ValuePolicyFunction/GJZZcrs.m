function[ZZ]=GJZZcrs(sf);


% given sf=(save,phi), return -W
% k and other parameters are exogenous

global SSS FFF h1 h2 h3 h4 f g GJbet GJkA GJkB GJKJ GJA;
global GJq GJnp GJdel GJsig WA VA;

SSS=sf(1);
FFF=sf(2);							
penals=0;
penalf=0;


% 15 weights

w0a=(h2-h1)/2;
w0f=(h3-h2)/2;
w0d=(h4-h3)/2;
w1=0.568889;
w2=0.478629;
w3=0.478629;
w4=0.236927;
w5=0.236927;
Wa=w0a*[w1 w2 w3 w4 w5];
Wf=w0f*[w1 w2 w3 w4 w5];
Wd=w0d*[w1 w2 w3 w4 w5];
W=[Wa Wf Wd];


% 15points=5ascending, 5 flat, 5 descending

xa1=(h2-h1)/2+h1; 
xa2=(1.538469*(h2-h1)/2)+h1;
xa3=(0.461531*(h2-h1)/2)+h1;
xa4=(1.906180*(h2-h1)/2)+h1;
xa5=(0.09382*(h2-h1)/2)+h1;
xf1=(h3-h2)/2+h2;
xf2=(1.538469*(h3-h2)/2)+h2;
xf3=(0.461531*(h3-h2)/2)+h2;
xf4=(1.906180*(h3-h2)/2)+h2;
xf5=(0.09382*(h3-h2)/2)+h2;
xd1=(h4-h3)/2+h3;
xd2=(1.538469*(h4-h3)/2)+h3;
xd3=(0.461531*(h4-h3)/2)+h3;
xd4=(1.906180*(h4-h3)/2)+h3;
xd5=(0.09382*(h4-h3)/2)+h3;

x=[xa1 xa2 xa3 xa4 xa5 xf1 xf2 xf3 xf4 xf5 xd1 xd2 xd3 xd4 xd5];


% 15pdfs

pda1=(xa1-h1)/(f*g);
pda2=(xa2-h1)/(f*g);
pda3=(xa3-h1)/(f*g);
pda4=(xa4-h1)/(f*g);
pda5=(xa5-h1)/(f*g);
pdff=1/f;
pdd1=(h4-xd1)/(f*g);
pdd2=(h4-xd2)/(f*g);
pdd3=(h4-xd3)/(f*g);
pdd4=(h4-xd4)/(f*g);
pdd5=(h4-xd5)/(f*g);

pdf=[pda1 pda2 pda3 pda4 pda5 pdff pdff pdff pdff pdff pdd1 pdd2 pdd3 pdd4 pdd5]; 


% 15 derivatives and second derivatives

ZK=zeros(15,1);
for i=1:15
     ZK(i)=wpcrs(x(i));
end

if SSS>=1;
	penals=-1e20;
else
	if FFF>1;
		penalf=-1e20;
	elseif FFF<0;
		penalf=-1e20;
	end
end
penal=penals + penalf;
if penal<=-100000000
	zz=penal;
else
        %intZ=quadlg('wpf1crs',h1,h2)+quadlg('wpf2crs',h2,h3)+quadlg('wpf3crs',h3,h4);
	intZ=(W.*pdf)*ZK;
	zz= (((1-SSS)*GJKJ)^(1-GJsig))/(1-GJsig) + GJbet*intZ;
end
ZZ=-zz;