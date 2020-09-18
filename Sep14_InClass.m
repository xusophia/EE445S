% Define a vector where n goes from 0 to 24000
n = 0 : 24000;
fs = 8000;            %%% sampling freq. Hz
f0 = 220;             %%% desired freq. Hz 
w0 = 2*pi*(f0/fs);

% (a) Generating a chrip signal 
x_n = 0.1 * cos(w0*n + (pi*(0.7*10^(-5)) * (n.^2)));

blockSize = 1024;
overLap = 512;
% (b) Create the spectrogram with fs = 8000
spectrogram(x_n, blockSize, overLap, blockSize, fs, 'yaxis');

% (d) Matlab comments to describe what I hear: 
% It seems that when the sound is played, that (over time) 
% the sound goes up in pitch (from a lower pitch to a higher pitch) 
soundsc(x_n, fs);










