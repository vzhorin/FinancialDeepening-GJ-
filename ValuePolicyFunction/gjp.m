hold on
plot(GJk,v,'-.')
plot(GJk,GJW)
plot(GJk,vq,':')
plot(GJk,wo,'--')
mm=max(v);
mmm=min(v);
axis([GJkA GJkB mmm-10, mm+10])
s = sprintf('%1.1f ',GJsig);
g = sprintf('%1.2f',gam);
ta = sprintf('%1.1f',GJTA);
tb = sprintf('%1.3f',GJTB);
eb = sprintf('%1.3f',GJEB);
kst= sprintf('%1.1f',CritK);
%title(['\sigma =' s ', \gamma  =' g ', \theta = [' ta ',' tb '], \epsilon = [- ' eb ',+' eb '];  k* =' kst ]);
legend('V(k)','W(k)','V(k-q)','Wo(k)',4);
xlabel('wealth (model unit)')
ylabel('value')
hold off

