pn_seq = [1 1 -1 -1 1 1 -1 1 -1 -1 1 -1 -1 -1 -1 1 -1 1 -1 1 1 1 -1 1 1 -1 -1 -1 1 1 1];

bin_size = 2*pi/length(pn_seq);
%% One FFT coefficient corresponds to discrete-time frequency of zero rad/sample.
w = -pi + bin_size/2 : bin_size : pi - bin_size/2;
%% Plot the magnitude spectrum of the PN sequence
stem(w, abs(fftshift(fft(pn_seq))))
title("Magnitude spectrum of PN sequence")

freqz(pn_seq);