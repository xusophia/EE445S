clear all
N = 100;
%% 1. Fill up these fields based on the instrunction.
fs = 8000;                     %%% sampling freq. Hz
omega0 = 3000;
fDesired = omega0/(2*pi);               %%% desired freq. Hz
w0 = (2*pi*fDesired)/fs;      %%% discrete-time freq.
% N0 =  fs / gcd(fDesired, fs); %%% fundamental period

%% 2. Compute N samples of the cosine signals using "function call" 
y_cos = zeros(1,N);
phase = 0;

for i=1:N
    % Define a phase increment here
    % Increase the phase by the increment
    phase = phase + w0;
    
    if (phase >= 2*pi)
        phase = phase - 2*pi;
    end
    
    y_sin(i) = sin(phase);% store the corresponding cosine value
end


stem(1:N, y_sin)
xlabel('n')
title(['sin(2$\pi$(', num2str(fDesired),'/', num2str(fs),')n)'], 'Interpreter','latex')