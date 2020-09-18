f0 = 20; % Principal frequency f0 is 20Hz
fStep = 420; % fStep = 420


fs = 44100; % Sampling rate is 44100 Hz
t = 0: 1/fs: 10;
theta_t = 2*pi*(f0 + 0.5*fStep*t).*t;
c_t = cos(theta_t);

 soundsc(c_t, fs);
plotspec(c_t, 1/fs);

blockSize = 1024;
overLap = 512;
% (b) Create the spectrogram with fs = 8000
spectrogram(c_t, blockSize, overLap, blockSize, fs, 'yaxis');
