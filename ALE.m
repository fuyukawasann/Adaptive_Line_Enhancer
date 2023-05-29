function ale = ALE(A, omega, N, a, delta, M)

%% Parameter
% A : Amplitude of sine wave
% omega : freq. of sine wave
% N : number of points
% a : max. value of noise's interval
% delta : step size
% M : desired length of the adaptive FIR Fiter

%% Noise
% a1 is modified a (neg -> pos)
[w, a1] = noise(a, N);

%% Sinusoidal
sw = sinusoidal(A, omega, N);

%% Input Signal
x = w + sw;

%% Filtered Input
s = lms1(a1, x, delta, M);

%% OUTPUT
ale = x - s;

%% Plot
subplot(1,4,1);
plot(1:N, ale);
subplot(1,4,2);
plot(1:N,ale-w);
subplot(1,4,3);
plot(1:N,w);
subplot(1,4,4);
plot(1:N,ale-sw-w);



