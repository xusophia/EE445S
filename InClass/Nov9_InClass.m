% In-Lecture Assignment #5 Related to Homework #6

% Consider performing an iterative maximization of

% J(x) =8 - x2 + 6 cos(6 x)

% via the steepest descent algorithm (JSK equation (6.5) on page 116)

% with the sign on the update reversed from negative to positive so that

% the algorithm will maximize rather than minimize; i.e.

% x[k+1] = x[k] + u dJ(x) / dx where x = x[k]

% a. Visualize and analyze the shape of the objective function J(x).

%%     1) Plot J(x) for -5 < x < 5. Give the Matlab code for your answer.

 x = -5 : 0.001 : 5;
 Jx = 8 - x.^2 + 6*cos(6*x);
 plot(x, Jx)

%%
%     2) Describe the plot.

%   It is a sum (combination) of a concave down parabola and a cosine.
%   Concavity alternates within the cosine, but overall 
%   its a concave down parabola. There are many local maximas.
%   

%    3) How many local maxima do you see?

%        11 local maxima because you are considering endpoints in the
%        restricted view

%     4) Of these local maxima, how many are global maxima?

%       Only onne at x = 0

 

% b. Derive the steepest descent update equation

%   dJdx = -2*x - 36*sin(6*x)

% and modify the code below to include the derivate of J(x)

% polyconverge.m find the maximum of J(x)=x via steepest descent

N=50;                      % number of iterations

mu=0.001;                % algorithm stepsize

x=zeros(1,N);              % initialize sequence of x values to zero

x(1)=0.7;                 % starting point x(1) (initial guess!)

for k=1:N-1

  x(k+1)= x(k) + (-2*x(k) - 36*sin(6*x(k)))*mu;    % update equation

end

figure();

stem(x);          % to visualize approximation

x(N)

 

% c. Implement the steepest descent algorithm in Matlab with x[0] = 0.7.

%     1) To what value does the steepest descent algorithm converge?

%          x = 1.0376

%     2) Is the convergent value of x in the global maximum of J(x)? Why or why not?

%       No, since the global maxima only occurs at x = 0 and the value of
%       the convergent value of x is not equal to the value at x = 0 in
%       J(x).
%       