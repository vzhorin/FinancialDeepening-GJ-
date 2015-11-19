function[C]=feconst(N,T)
% feconst(N,T)
% Fixed Effect Constant, N people, T periods. Returns 
% ones(T,1) are located in diagonal places. Size N*T x N
% By Kenichi Ueda 2003

summer=ones(T,1);
for n=1:N
    C((n-1)*T+1:((n-1)*T+T),n)=summer;
end    