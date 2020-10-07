% y[n] = (2 cos w0) y[n-1] - y[n-2] + x[n] - (cos w0) x[n-1]
f1Desired = 2000;              %%% desired freq. Hz
f2Desired = 6000;
fs = 8000;
w01 = 2*pi*f1Desired/fs;        %%% discrete-time freq.
w02 = 2*pi*f2Desired/fs;
N = 50;
y_n1 = zeros(1,3);          %%% pre-allocate array for difference equation
y_n2 = zeros(1,3);
% PURELY a graph to graph outputs, not realistic array
output_1 = zeros(1, N);
output_2 = zeros(1, N);

% matlab is 1 indexed
y_n1(1) = 1; % y[0] = 1
output_1(1) = y_n1(1); % bc y[0] = 1
y_n1(2) = cos(w01); % y[1] = cos(w0)
output_1(2) = y_n1(2);

y_n2(1) = 1;
output_2(1) = y_n2(1);
y_n2(2) = cos(w02);
output_2(2) = y_n2(2);

x_n = zeros(1, 2);
x_n(1) = 0;  % Only x[0] = 1 because using impulse, but here y[0]  
             % was already calculated, x[1] = 0 set instead.
x_n(2) = 0; 

y_ind = 3;
x_ind = 2;
for i=3:N
    y_n1(y_ind) = (2*cos(w01))*y_n1(y_ind-1) - y_n1(y_ind-2) + x_n(x_ind) -(cos(w01))*x_n(x_ind-1);
    y_n2(y_ind) = (2*cos(w02))*y_n2(y_ind-1) - y_n2(y_ind-2) + x_n(x_ind) -(cos(w02))*x_n(x_ind-1);

    output_1(i) = y_n1(y_ind);
    output_2(i) = y_n2(y_ind);
    
    y_n1(1) = y_n1(2);
    y_n1(2) = y_n1(3);
    x_n(2) = 0;
    x_n(1) = 0;
    
    y_n2(1) = y_n2(2);
    y_n2(2) = y_n2(3);
    %y_n2(i) = (2*cos(w02))*y_n2(i-1) - y_n2(i-2) + x_n(i) - (cos(w02))*x_n(i-1);
end

subplot(1,2,1)
stem(0:N-1, output_1)
xlabel('n')
ylabel('y[n] with freq 2kHz')
grid on

subplot(1,2,2)
stem(0:N-1, output_2)
xlabel('n')
ylabel('y[n] with freq 6kHz')
grid on
