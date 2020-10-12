% close all
% clear all
% Run the MATLAB filter design and analysis tool to design
% an FIR filter and export the coefficients to Num and Den variable

N = 2; % order of IIR filter
M = 3; % # of biquads

% IIR filter length is the filter order + 1
x = zeros(M, N+1); % input value (buffered)
y = zeros(M, N+1); % output values (buffered)
B = SOS(:, 1:3);% numerator coefficients
A = zeros(:, 4:6); % denominator coefficients
% G = zeros(1,M+1); % scaling factors

fs = 48000;         % Sampling frequency
Ts = 1/fs;          % Sampling period
T = Ts:Ts:1;        % Time duration of signal



%% sum of 1 kHz cosine and its harmonics up to 24 kHz. 
f0 = 1000;
signal = cos(2*pi*f0*T);
for j = 2:24
    signal = signal + cos(2*pi*j*f0*T);
end



%% FIR Filter
y_filtered = zeros(1,length(T));   % Store output for one bufffer

for t = 1:length(T)

    
    x(1,1) = signal(t); % get input data sample as current input value
    for m = 1:M
        [x, y] = biquad(x, y, B, A, G, m, M)
    end
   	y_filtered(t) = y(M,1);

    
end


%% Compute gain from input to output using peak-to-peak values
VppOutput = max(y_filtered(1+(N+1):end)) - min(y_filtered(1+(N+1):end));
VppInput= max(y_filtered(1:end-(N+1))) - min(y_filtered(1:end-(N+1)));
gain = VppOutput / VppInput;
gain_dB = 20*log10(gain); % gain in dB scale

figure
plot(T, y_filtered);
axis([-inf inf -1 1])

%% FFT
n = length(T);

figure
subplot(1,2,1)
f = fftshift(fft(signal));
plot(-fs/2:fs/n:(fs/2-fs/n), 10*log10(abs(f)))

subplot(1,2,2)
f = fftshift(fft(y_filtered));
plot(-fs/2:fs/n:(fs/2-fs/n), 10*log10(abs(f)))



% Note that in function ‘biquad’ you need to do the followings:
% Scaling  x(m, 1) with proper factor
% Computing the output using x(m, :) and y(m, :); 
% Updating the state variables of (m)th biquad
% Connecting (m)th biquad and (m+1)st biquad by assigning x(m+1,1)=y(m,1).
function [x,y] = biquad(x, y, B, A, G, m, M)
    x(m, 1) = x(m, 1) * G(m);
    
    y(m, 1) = - A(m, 2) * y(m, 2) - A(m,3) * y(m, 3) + B(m, 1) * x(m, 1)+ ...
                B(m, 2) * x(m, 2) + B(m, 3) * x (m, 3);
    x(m, 3) = x(m, 2);    
    x(m, 2) = x(m, 1);
    y(m, 3) = x(m, 2);
    y(m, 2) = y(m, 1);
    if( m ~= M)
        x(m+1,1) = y(m,1);
    end
end