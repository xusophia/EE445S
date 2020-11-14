SNR = 0: 0.1 : 10;


for i = 1:3
    M = 2^i;
    Pe = ((2*(M-1))/(M))*(0.5)*erfc((((3/(M^2-1))/(sqrt(2)))*(SNR)).^0.5)
    semilogy(10*log10(SNR), Pe)
    hold on
    % error probability and datarate tradeoff 
    % 8 pam has 3 bits at a time, so error prob sacrificed
end
