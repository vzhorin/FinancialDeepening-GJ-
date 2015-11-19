function[G]=Gfaicrs(fi);
global h1 h2 h3 h4 f g fai;

fai=fi;
G=quadlg('Gfaicrs1',h1,h2)+quadlg('Gfaicrs2',h2,h3)+quadlg('Gfaicrs3',h3,h4);
