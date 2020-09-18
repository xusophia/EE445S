%%% Code to generate an array of discrete-time
%%% cosine and sine signals one sample at a time.
%%% Arrays are pre-allocated for efficiency.
fs = 8000;                    %%% sampling freq. Hz
f1Desired = 1000;             %%% desired freq. Hz #1
f2Desired = 7000;             %%% desired freq. Hz #2   
w01 = (2*pi*f1Desired)/fs;      %%% discrete-time freq. #1
w02 = (2*pi*f2Desired)/fs;      %%% discrete-time freq. #2

N01 = fs / gcd(f1Desired, fs);  %%% fundamental period
N02 = fs / gcd(f2Desired, fs);
N = 50;                         %%% samples to plot
phase1 = 0;
phase2 = 0;
y_cos1 = zeros(1,N);           %%% pre-allocate array
y_cos2 = zeros(1,N);           %%% pre-allocate array

%%% Compute N samples of the cosine and sine signals
for i=1:N
    phase1 = phase1 + w01;
    phase2 = phase2 + w02;
    
    if (phase1 >= 2*pi)
        phase1 = phase1 - 2*pi;
    end

    if (phase2 >= 2*pi)
        phase2 = phase2 - 2*pi;
    end
    y_cos1(i) = cos(phase1);
    y_cos2(i) = cos(phase2);
end
%%

subplot(1,2,1)
stem(1:N, y_cos1)
title(['cos(2$\pi$(', num2str(f1Desired),'/', num2str(fs),')n)'], 'Interpreter','latex')
xlabel( strcat(num2str(N01), ' samples in fundamental period') );
grid on

subplot(1,2,2)
stem(1:N, y_cos2)
title(['cos(2$\pi$(', num2str(f2Desired),'/', num2str(fs),')n)'], 'Interpreter','latex')
xlabel( strcat(num2str(N02), ' samples in fundamental period') );
grid on