function sw = sinusoidal(A, omega, N)

% Parameter
% A : Amplitude
% omega : freq.
% n : input variable

if (0 < omega) && (omega < pi)
else
    error("Wrong Omega Value!!");
end

n = [0:N-1]';

sw = A*sin(omega*n);


end