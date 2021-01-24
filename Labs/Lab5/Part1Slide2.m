%%% Lab 5 Slide 2

%% Symbol generation
% Using the commands round and rand, generate 200 random bits (0 or 1)
% Map the bits to modulation amplitudes using BPSK scheme, the 200 bits will be directly used as the input symbols

random_200 = rand(1, 200);
random_200 = round(random_200);

random_200 = 2*random_200 - 1

sps = 20;

filter_1 = rcosdesign(1, 8, 20, 'normal')
filter_0125 = rcosdesign(0.125, 8, 20, 'normal')

random_200 = upsample(random_200, 20)
convolved = conv(filter_1, random_200);
eyediagram(convolved, 40);

% hold on
% stem(random_200)
% stem(convolved)
%% One FFT coefficient corresponds to discrete-time frequency of zero rad/sample.
w = - 80 : 80;
%% Plot the magnitude spectrum of the PN sequence
plot(w, abs(fftshift(fft(filter_1))))
% plot(w, abs(fftshift(fft(filter_0125))))

% freqz(filter_1)
% impz(filter_1)
% impz(filter_0125)
%%
R = 2*round(rand([200, 1]))-1;
C = conv(rcosdesign(1,8,20,'normal'),upsample(R,20));
hold on
plot(upsample(R,20));
plot(C);
eyediagram(C, 40);
%%
R = 2*round(rand([200, 1]))-1;
C = conv(rcosdesign(0.125,8,20,'normal'),upsample(R,20));
hold on
plot(upsample(R,20));
plot(C);
eyediagram(C, 40);