function x = noise(a, N)

% Parameters
% a : [-a, a] interval
% N : number of Points
% x : noise signal

if a < 0
    a = -1*a;
elseif a == 0
    error("Do NOT set a as zero!!");
end

x = -a+rand(N,1).*(2*a);
end