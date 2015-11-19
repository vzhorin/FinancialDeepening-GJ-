function[C]=timedum(N,T,ini)

% timedum(N,T,ini)
% Time Dummy, N people, T periods. 
% Returns eye(T,T) are stacked N times below. Size T x T*N.
% Can choose ini=0, i.e., stacked component lose the first column 
% so that first period have no constant to avoid singularity 
% when using with constant or fixed effect matrix.
% Otherwise, put ini=1 (or any number).
% By Kenichi Ueda 2003

td0=eye(T,T);
if ini==0
    td=td0(:,2:T);
else
    td=td0;
end
C=td;
for n=1:N-1
    C=cat(1,C,td);
end    