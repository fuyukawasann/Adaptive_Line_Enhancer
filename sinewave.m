function s = sinewave(A, M, w0)

% Parameters
% A : Amplitude
% M : Number of samples
% w0 : frequency

n = 0:M-1;
s = A*sin(w0*n);

% Constraint
% A must be smaller than noise's Amplitude which we denoted as a.
% 0 < w0 < pi

% Test Plotting
%plot(s);


end