function [h,sh] = lms(x, delta, N)

% Parameters
% sh : s hat
% x : s + w
% delta
% N : Sampled number of filter

% make delayed input signal at once
nx = [0, x(1,1:length(x)-1)];
%disp(nx);

M = length(nx); sh = zeros(1,M);
h = zeros(1,N);
%disp(M);
%disp(N);

for n = N:M
    % disp(n);
    nx1 = nx(n:-1:n-N+1);
    sh = h * nx1';
    e = x(n)-sh;
    h = h + delta*e*nx1;
    % disp(sh);
end
end