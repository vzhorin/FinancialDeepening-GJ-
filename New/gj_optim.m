function [x,fval,exitflag,output] = gj_optim(x0,lb,ub)

if nargin<3 ub = [0.99 1.1 1 10 1.99]; end
if nargin<2 lb = [0.9 1.01 0.95 1 1]; end
%if nargin<1 x0 = [0.96 1.054 0.98 5 1]; end
%if nargin<1 x0 = [0.94 1.054 0.98 2.37 1.17]; end
if nargin<1 x0 = [0.9598 1.0205 0.9827 5.2424 1.8760]; end
%if nargin<1 x0 = [0.9010, 1.0110, 0.9607,  8.0408, 1.0086]; end
% Start with the default options
options = saoptimset;
% Modify options setting
options = saoptimset(options,'Display' ,'iter', 'TolFun', 1e-1);
%options = saoptimset(options,'PlotFcns' ,{  @saplotbestf @saplotbestx @saplotstopping @saplottemperature @saplotx @saplotf });
%options = saoptimset(options,'OutputFcns' ,{ [] });
[x,fval,exitflag,output] = ...
simulannealbnd(@gj_master,x0,lb,ub,options);
