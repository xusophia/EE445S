pn_seq = [1 1 -1 -1 1 1 -1 1 -1 -1 1 -1 -1 -1 -1 1 -1 1 -1 1 1 1 -1 1 1 -1 -1 -1 1 1 1];

bin_size = 2*pi/length(pn_seq);
%% Calculate w with the fact that 1 FFT coefficient corr. to discrete-time frequency of zero rad/sample.
w = -pi + bin_size/2 : bin_size : pi - bin_size/2;
%% Plot the magnitude spectrum of the PN sequence
stem(w, abs(fftshift(fft(pn_seq))))
title("Magnitude spectrum of PN sequence")


%% DTFT
pn_seq = [1 1 -1 -1 1 1 -1 1 -1 -1 1 -1 -1 -1 -1 1 -1 1 -1 1 1 1 -1 1 1 -1 -1 -1 1 1 1];
%% Plot the magnitude spectrum of the PN sequence
freqz(pn_seq);