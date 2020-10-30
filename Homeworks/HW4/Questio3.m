n = [-3 -1 1 3] 
p = -4 %general random nums on interval [p, q]
q = 4;
totalCorrect = 0;
totalRuns = 10000;

a = 0.5; b = 0.9;
h = [1, 0, 0, a, 0, 0, 0, b];


%% concolve impulse response of channel with data sequence 

for run = 1:totalRuns
 %% Begin code from Software Receiver Design book
 header = 3*ones(1,31); % header is a predefined string of all '3's
 loc=310; r=25; % place header in position loc
 signal1 = p + (q-p).*rand(1,loc+r); % generate random numbers on [p,q]
 signal1 = quantalph(signal1,n);
 signal1 = signal1';
 data=[signal1(1:loc-1) header signal1(loc:end)]; % generate signal
 sd=0; data=data+sd*randn(size(data)) ; % add noise
 y=xcorr(header, data) ; % do cross correlation
 [m, ind]=max(y); % location of largest correlation
 headstart=length(data)-ind+1; % place where header is detected
 %% End of code from Software Receiver Design book
 if ( loc == headstart )
 totalCorrect = totalCorrect + 1;
 end
end
totalCorrect / totalRuns
