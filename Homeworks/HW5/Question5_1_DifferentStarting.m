N=600; % number of iterations
mu=.01; % algorithm stepsize
x=zeros(size(1,N)); % initialize x to zero
for i=1:100
 x(1)=randi([-1000 1000],1,1); % starting point x(1)
 for k=1:N-1
 x(k+1)=(1-2*mu)*x(k)+14*mu; % update equation
 end
 plot (x);
 hold on;
end
hold off;
title('Effect of Starting Point');