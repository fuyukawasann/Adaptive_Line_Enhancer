function x = noise(a, n)

% Parameters
% a : [-a, a] interval
% n : number of Points
% x : noise signal

if a < 0
    a = -1*a;
elseif a == 0
    error("Do NOT set a as zero!!");
end

x = -a+rand(n,1).*(2*a);
end