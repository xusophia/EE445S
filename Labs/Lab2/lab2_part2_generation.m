clear all
N = 16000;
%% 1. Fill up these fields based on the instrunction.
fs = 8000;                     %%% sampling freq. Hz
fDesired = 1000;               %%% desired freq. Hz
w0 = (2*pi*fDesired)/fs;      %%% discrete-time freq.
N0 =  fs / gcd(fDesired, fs); %%% fundamental period

%% 2. Compute N samples of the cosine signals using "function call" 
tic
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

toc
stem(1:N, y_sin)
xlabel('n')
title(['sin(2$\pi$(', num2str(fDesired),'/', num2str(fs),')n)'], 'Interpreter','latex')
%% 3. Compute N samples of the cosine signals using "look-up table" 
tic 

y_cos = zeros(1,N);
phase = 0;

N = 16000;

LUT = zeros(1, N0); % Determine a LUT buffer with a proper size

% Fill up the LUT, you may use the same method as the one in function call,
% but with differnt buffer size!

for i=1:N0
    % Define a phase increment here
    % Increase the phase by the increment
    phase = phase + w0;
    
    if (phase >= 2*pi)
        phase = phase - 2*pi;
    end
    
    LUT(i) = sin(phase); % store the corresponding cosine value
end

% For each discrete time, call a value from LUT. 
% Avoid the use of mod() operator.
idx = 1;
for i=1:N
    y_sin(i) = LUT(idx); % store the corresponding cosine value
    idx = idx + 1;
    if(idx == (N0 + 1))
        idx = 1;
    end
end

toc 

stem(1:N, y_sin)
xlabel('n')
title(['sin(2$\pi$(', num2str(fDesired),'/', num2str(fs),')n)'], 'Interpreter','latex')

sound(y_sin, fs)
pause(5);
sound(y_sin*.1, fs)
pause(5);
sound(y_sin*10, fs)