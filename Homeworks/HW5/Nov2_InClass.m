% polyconverge.m find the minimum of J(x)=x^2-4x+4 via steepest descent
N=500;                          % number of iterations
mu=[-.01, 0, 0.0001, 0.02, 0.03, 0.05, 1.0, 10.0];                         % algorithm stepsize
mu_len = 8;
x=zeros(1,N);                   % initialize x to zero
x(1)=3;                         % starting point x(1)

for i = 1:mu_len
    for k=1:N-1
      x(k+1)=(1-2*mu(i))*x(k)+4*mu(i);    % update equation
    end
    disp(x(k))
end