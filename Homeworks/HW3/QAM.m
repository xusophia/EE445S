% QAM.m which is a modified version of
% AM.m suppressed carrier AM with freq and phase offset
% from Johnson, Sethares and Klein, Software Receiver Design
% Define sampling rate, sampling time, and time duration
fs=10000; % sampling rate
time=0.3; Ts=1/fs; % sampling interval & time
t=Ts:Ts:time; lent=length(t); % define a time vector
% Transmitter
upramp=(5/lent)*(1:lent);
fm=20;
m1=upramp+cos(2*pi*fm*t); % create message m1(t)
downramp=(5/lent)*(lent:-1:1);
fm=20;
m2=downramp+cos(2*pi*fm*t); % create message m2(t)
fc=1000;
c=cos(2*pi*fc*t); % cosine carrier at freq fc
s=sin(2*pi*fc*t); % sine carrier at freq fc
v=m1.*c - m2.*s; % modulate
% Receiver
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; % fpass=500 Hz and fstop=1000 Hz
fl=100; b=firpm(fl,fbe,damps); % LPF with (f1+1) coefficients
n0=fl/2; % group delay through LPF
gam=pi/2; phi=0; % freq & phase offset
cr=cos(2*pi*(fc+gam)*t+phi); % create cosine for demod
x1=v.*cr; % demod received signal
s1=2*conv(b,x1); % LPF the demodulated signal
s1short=s1(n0+1:n0+lent); % remove first and last n0 samples
sr=sin(2*pi*(fc+gam)*t+phi); % create negated sine for demod
x2=v.*sr; % demod received signal
s2=2*conv(b,x2); % LPF the demodulated signal
s2short=s2(n0+1:n0+lent); % remove first and last n0 samples
% used to plot figure
subplot(4,1,1), plot(t,m1)
axis([0,0.1, -1,3])
ylabel('amplitude'); title('(a) message #1 signal');
subplot(4,1,2), plot(t,v)
axis([0,0.1, -2.5,2.5])
ylabel('amplitude'); title('(b) transmitted signal');
subplot(4,1,3), plot(t,x1)
axis([0,0.1, -1,3])
ylabel('amplitude');
title('(c) demodulated signal prior to filtering');
subplot(4,1,4), plot(t,s1short)
axis([0,0.1, -1,3])
ylabel('amplitude');
title('(d) recovered message #1 signal by applying LPF to (c)');
