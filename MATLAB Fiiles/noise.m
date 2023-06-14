function [w, nM] = noise(a, M)

if (M < 0)
    M = -M;
elseif (M == 0)
    error("M must have positive integer");
end

% Make a White Noise that has uniformly distributed
w = -a+2*a*rand(1,M);
nM = M;

% Plotting NOISE for test
%plot(w);

end

%y = rand(1,n);      % Generate white noise
%[b,a] = butter(6,fc/(fs/2));     % Bandpass filter design
%y_filt = filter(b,a,y);    % Filter white noise