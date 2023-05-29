function [h, y] = lms1(a, x, delta, M)

% LMS Algorithm for Coefficient Adjustment
% 
% == OUTPUT Parameters ==
% h : adaptive filter coefficients
% y : output
%
% == INPUT Parameters ==
% a : [-a a] interval
% x : input sequence 
% delta : step size
% M : desired length of the adaptive FIR Filter

Pw = a^2/3; % Power of input signal

N = length(x); y = zeros(1, N);
h = zeros(1,M);
d = delayseq(x,1);

% Determine delta
if (0 < delta) && (delta < 1/(10*N*Pw))
else
    error("Wrong delta");
end

if M >= N
    error("Wrong Value of M");
end

for n = M:N
    d1 = d(n:-1:n-M+1);
    y = h * d1;
    e = x(n) - y;
    h = h + delta*e*d1';
end

end