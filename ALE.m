function ale = ALE(a, M, A, w0, delta, N)

%% Noise
% a1 is modified a (neg -> pos)
[w, nM] = noise(a, M);

%% Sinusoidal
s = sinewave(A, nM, w0);

%% Input Signal
x = inputwave(s,w);

%% Filtered Input
[h, sha] = LMS(x, delta, N);

%% OUTPUT
ale = x - sha;

%% Plot
% figure(1)
% subplot(3,2,1)
% plot(1:M, ale)
% title('ALE')
% 
% subplot(3,2,2)
% plot(1:M, ale-w)
% title('ALE-noise')
% 
% subplot(3,2,3)
% plot(1:M,w)
% title('noise')
% 
% subplot(3,2,4)
% plot(1:M,ale-s-w)
% title('ALE-sinewave-noise')
% 
% subplot(3,2,5);
% plot(1:M,s);
% title('Sinewave')
% 
% subplot(3,2,6);
% plot(1:M,sha);
% title('S of hat')
