
% Exercise 8.14. Add a channel with impulse response 1, 0, 0, a, 0, 0, 0, b to this
% example. (Convolve the impulse response of the channel with the data sequence.)
% a. For a = 0.1 and b = 0.4, how does the channel change the likelihood that the
% correlation correctly locates the marker? Try using both markers A and B.
% b. Answer the same question for a = 0.5 and b = 0.9.
% c. Answer the same question for a = 1.2 and b = 0.4.

a = 1.2;
b = .4;
imp = [1, 0, 0, a, 0, 0, 0, b]; % impulse response of channel
n = [-3 -1 1 3];
p = -4;
q = 4;
totalCorrect = 0;
totalRuns = 10000;
for run = 1:totalRuns
 %% Begin code from Software Receiver Design book
 header = 3*ones(1,31); % header is a predefined string of all '3's
%  h = [1 1 -1 -1 1 1 -1 1 -1 -1 1 -1 -1 -1 -1 1 -1 1 -1 1 1 1 -1 1 1 -1 -1 -1 1 1 1];
%  header = 3*h; % header is a predefined string in set {-3,3}
 loc=310; r=25; % place header in position loc
 signal1 = p + (q-p)*rand(1,loc+r); % generate random numbers on [p, q]
 signal1 = quantalph(signal1,n);
 signal1 = signal1';
 data=[signal1(1:loc-1) header signal1(loc:end)]; % generate signal
 channel = filter(imp, 1, data); % add the channel
 sd=0.25; channel=channel+sd*randn(size(channel)) ; % add noise
 y=xcorr(header, channel) ; % do cross correlation
 [m, ind]=max(y); % location of largest correlation
 headstart=length(channel)-ind+1; % place where header is detected
 %% End of code from Software Receiver Design book
 if ( loc == headstart )
 totalCorrect = totalCorrect + 1;
 end
end
totalCorrect / totalRuns

freqz(imp)
