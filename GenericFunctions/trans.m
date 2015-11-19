
 function F = trans(polar, x1, x2, x3)
q1 = pi/2*sin(2*polar(2));
q2=polar(2);
F = (polar(1)*cos(q1)*cos(q2) - x1)^2+ (polar(1)*cos(q1)*sin(q2)- x2)^2+(polar(1)*sin(q1)-x3)^2;