function [x, A] = noise(a, N)

% Parameters
% a : [-a, a] interval
% N : number of Points
% x : noise signal

if a < 0
    a = -1*a;
elseif a == 0
    error("Do NOT set a as zero!!");
end
A = a;
x = -a+rand(N,1).*(2*a);
end