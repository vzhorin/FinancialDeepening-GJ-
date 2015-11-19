function[V]=GJcrsv(k, GJsig)

global VA;

V=VA*(k.^(1-GJsig));