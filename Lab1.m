% Creating continous time sinusoidal signal
Ts = 0.001;
t = 0: Ts : 1-0.001;
fc = 100; 
xt =  cos(2*pi*100*t)
plot(t, xt)
xlabel('x-axis: t')
ylabel('y-axis: xt')
title('Lab 1: Creating a continous time sinusoidal')
xt(find( t == 0.32 ))
xt(find( t == 0.64 ))

% Sampling continous time sinusoidal signal
v = 0: 0.008 : 1-0.008;
xn = cos(2*pi*100*v)
hold on
plot(t, xt)
stem(v, xn)
hold off

yt = fft(xt)
yt = fftshift(yt)
%plot(t, yt)
fs = 1000
n = 1000
w = -fs/2 : fs/n : (fs/2 - fs/1000);
plot(w, yt)
xlabel('w')
ylabel('yt')

% Warning 
%f = abs(yt)
%f = log10(f)

plot(w, f)
xlabel('w')
ylabel('f')






