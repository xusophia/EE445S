% In-Lecture Assignment related to Homework #4

% (a) Generate and plot 31 random values of +1 and -1.

N = 31;

randomSignal = randn(1,N);     %% N Gaussian random numbers, zero mean, unit variance

randomValues = sign(randomSignal);   %%% Converts to +1 and -1 values

stem(randomValues);             %%% Plot random +1 and -1 values

ylim( [-1.5, 1.5] );
%%% Description: a series of impulses ranging with values between -1 and +1
%%% 
% (b) Plot the autocorrelation
%%% Desciprtion: impulses that sort of resemble a (discrete time) sinc,
%%% with a peak at n = 0
figure;

n = -(N-1) : (N-1);

stem(n, xcorr(randomValues));

% (c) Why +1 and -1 values (Volts) and not 0 and 1 values (Volts)?

%%% The difference between -1V and +1 V is larger than the difference
%%% between 0 and 1 Volts. Thus, the -1 and +1 V values will have a higher
%%% SNR because they are more resillient to noise. 
%%% Also, using 0 and 1 values needs a DC offset of 0.5V (which is a
%%% non-zero DC component), so this wastes energy because this doesn't
%%% coney any useful info.