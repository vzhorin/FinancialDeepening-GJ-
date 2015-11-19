function[G]=Gfai(fi, GJdel)
global h1 h2 h3 h4 fai;

fai=fi; 
%G=quadlg('Gfai1',h1,h2, GJdel)+quadlg('Gfai2',h2,h3, GJdel)+quadlg('Gfai3',h3,h4, GJdel);
G = quadlg(@(x) Gfai1(x, GJdel), h1,h2) + quadlg(@(x) Gfai2(x, GJdel), h2, h3) + quadlg(@(x) Gfai3(x, GJdel), h3, h4);