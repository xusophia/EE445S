N=[5 40 100 525 5000]; % number of iterations
mu=.01; % algorithm stepsize
x=zeros(1); % initialize x to zero
x(1)=5; % starting point x(1)
y = zeros(5);

for i=1:length(N)
    for k=1:N(i)-1
        x(k+1)=(1-2*mu)*x(k)+14*mu; % update equation
    end
    y(i)= max(x)
    subplot(3,3,i); plot (x); title(strcat('N = ', int2str(N(i))));
end