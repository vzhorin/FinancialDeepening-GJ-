function[rt]=Rtheta(lowt,upt,del);

rt = del*(del-lowt)/(upt-lowt) + (upt^2 - del^2)/(2*(upt-lowt));