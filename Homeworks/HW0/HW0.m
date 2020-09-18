% Sampling Time: 1 over the sampling rate
Ts = 0.01;
% Plot from -0.5 to 1.5, vector is generated of these points in time
t = -0.5 : Ts : 1.5
fc = 10;
x = sin(2*pi*fc*t);
h = rectpuls(t-0.5)
c = x.*h
figure
plot(t, c)
grid
title('HW 0.1a')
xlabel('t')
ylabel('c(t)')



%0.2a
fc = 5;
f = [-20:0.1:20];
C = j*0.5*exp(-j*pi*(f+fc)) .* sinc(f+fc) - j*0.5*exp(-j*pi*(f-fc)) .* sinc(f-fc);
plot(f, abs(C))
grid
title('Magnitude of Fourier Transform of c(t)')
xlabel('f (Hz)')
ylabel('Magnitude of C(f)')


u = @(n) 1.0 * (n>0);

w0 = pi;
n = [0:25];
%u = stepfun(n, 0);
c = cos(w0*n);
u1 = u(n)
%figure, stem(n, h);
n = [0:25];

h = c .* u1;
%figure; plot(n, u(n));
figure, stem(n, h);