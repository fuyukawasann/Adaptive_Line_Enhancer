function [h, y] = lms(x, d, delta, N)

% LMS Algorithm for Coefficient Adjustment
% 
% == OUTPUT Parameters ==
% h : adaptive filter coefficients
% y : output
%
% == INPUT Parameters ==
% x : input sequence
% d : desired sequence
% delta : step size
% N : desired length of the adaptive FIR Filter

M = length(x); y = zeros(1, M);
for n = N:M
    x1 = x(n:-1:n-N+1);
    y = h * x1';
    e = d(n) - y;
    h = h + delta*e*x1;
end

end