clear all;

load thaidat5T2;
load thaigro;
%load thaidat2;

global part grinc del summer tetrang epsilon;
%global part grinc lte ute del summer; % for Thaieps

tetrang=0.1; % only for Thaieps2
epsilon=0.6;

%lte=0.65; % for Thaieps
%ute=1.49;

del=1.054;
summer=ones(20,1);

grid=100;
k=linspace(0.9,1.1,grid);

for i=1:grid
    z(i)=Thaieps2(k(i));
end
plot(k,z)

zstar1=fsolve('Thaieps2',1.05)
zstar2=fsolve('Thaieps2',1.1)

zstar=(zstar1+zstar2)/2