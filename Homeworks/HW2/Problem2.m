filename = 'twosignals.wav';
[ x, sr ] = audioread(filename);
Ts = 1/sr; % Sample interval
siz = length (x); % Number of samples
fs = 1/Ts;

blockSize = 1024;
overLap = 512;

%% Plot spectrogram of the wave file
spectrogram(x, blockSize, overLap, blockSize, fs, 'yaxis')

%% Plot the spectrum of the wave file
plotspec(x, Ts)
sound(x, 1/Ts)

% Set the Nyquist frequency to be half of the sampling rate fs.
% The sampling rate fs is set when reading the twosignals file 
% using the audioread command, and will be used by the sound 
% command to send audio samples to the sound card for playback.
fnyquist = fs/2;
%% Define the passband frequency fpass in Hz
fpass = 1800;

%% Define the stopband frequency fstop in Hz
fstop = 2000;
ctfrequencies = [0 fpass fstop fnyquist];
idealAmplitudes = [1 1 0 0 ];
pmfrequencies = ctfrequencies / fnyquist;

%% Number of coefficients is filter order plus one
filterOrder = 100; % 
filterCoeffs = firpm( filterOrder, pmfrequencies, idealAmplitudes );
gong = filter(filterCoeffs, 1, x);

%% Plot spectrum
 plotspec(gong, Ts)
%% Plot the spectrum of the wave file

 sound(gong, 1/Ts)
 spectrogram(gong, blockSize, overLap, blockSize, fs, 'yaxis')



%% BANDPASS FILTER
%% Define the passband frequency fpass in Hz
fpass = 2000;
%% Define the stopband frequency fstop in Hz
fstop = 2250;
ctfrequencies = [0 fpass fstop fnyquist];
idealAmplitudes = [0 0 1 1 ];
pmfrequencies = ctfrequencies / fnyquist;

%% Number of coefficients is filter order plus one
filterOrder = 100;
filterCoeffs = firpm( filterOrder, pmfrequencies, idealAmplitudes );
y = filter(filterCoeffs, 1, x);

%% Plot the spectrum of the wave file
plotspec(y, Ts)
sound(y, 1/Ts)



%% DOWNSAMPLE

downsampled_gong = downsample(gong, 2)
sound(downsampled_gong, (1/Ts))
pause(2)
plotspec(downsampled_gong, Ts)

%% Upsample
upsampled_gong = upsample(gong, 2)
sound(upsampled_gong, 2*(1/Ts))
%% Plot spec with original sampling period
plotspec(upsampled_gong, Ts)

%% Plot spec with upsampled sampling period
plotspec(upsampled_gong, 0.5*Ts)