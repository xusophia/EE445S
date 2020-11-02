%%% Question 4.1 part b
%%% JSK exercise 3.4 o page 43
%% Part a
% % signal = -1 + (1+1)*rand(1, 10000)
% % plotspec(x,1/10000)              % call plotspec to draw spectrum
% time=1; % length of time
% Ts=1/10000; % time interval between samples
% x=2*rand(1,time/Ts)-1; % Ts points of noise for time seconds
% plotspec(x,Ts) % call plotspec to draw spectrum

%% Part b
%%% Use rand and the sign function to create a signal that is +1 with probability
%%% 1/2 and -1 with probability 1/2. Find the spectrum of the signal
time=1; % length of time
Ts=1/10000; % time interval between samples
w=2*rand(1,time/Ts)-1; % Ts points of noise for time seconds
x=sign(w);
plotspec(x,Ts) % call plotspec to draw spectrum
%% Part c
time=1; % length of time
Ts=1/10000; % time interval between samples
x=sqrt(3)*randn(1,time/Ts); % Ts points of noise for time seconds
plotspec(x,Ts) % call plotspec to draw spectrum