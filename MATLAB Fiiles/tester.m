function [ts, shaz] = tester(a, M, A, w0, delta)

ts = [];
shaz = [];


[w, nM] = noise(a, M);
s = sinewave(A, nM, w0);
x = inputwave(s,w);

for N = 1:M
    [h, sha] = LMS(x, delta, N);
    ale = x - sha;
    ts = [ ts ale' ];
    shaz = [ shaz sha' ];
end

% figure(1)
% hold on
% for i1 = 1:M
%     plot(ts(:,i1))
% end
% 
% figure(2)
% hold on
% for i2 = 1:M
%     plot(shaz(:,i2))
% end