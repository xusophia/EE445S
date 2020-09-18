% y[n] = (2 cos w0) y[n-1] - y[n-2] + x[n] - (cos w0) x[n-1]
f1Desired = 1000;              %%% desired freq. Hz
f2Desired = 2000;
fs = 8000;
w01 = 2*pi*f1Desired/fs;        %%% discrete-time freq.
w02 = 2*pi*f2Desired/fs;        %%% discrete-time freq.
N = 50;
y_n1 = zeros(1,3);          %%% pre-allocate array for difference equation
y_n2 = zeros(1,3);

% PURELY a graph to graph outputs, not realistic array
output = zeros(1, N);

% matlab is 1 indexed
y_n1(1) = 1; % y[0] = 1
output(1) = y_n1(1);
y_n1(2) = cos(w0); % y[1] = cos(w0)
output(2) = y_n1(2);

y_n2(1) = 1; % y[0] = 1
%output(1) = y_n2(1);
y_n2(2) = cos(w0); % y[1] = cos(w0)
%output(2) = y_n2(2);

x_n = zeros(1, 2);
x_n(1) = 1;  
x_n(2) = 0; 

y_ind = 3;
x_ind = 2;
for i=3:N
    y_n1(y_ind) = (2*cos(w01))*y_n1(y_ind-1) - y_n1(y_ind-2) + x_n(x_ind) -(cos(w01))*x_n(x_ind-1);
    output(i) = y_n1(y_ind);
    y_n1(1) = y_n1(2);
    y_n1(2) = y_n1(3);
    x_n(1) = 0;
    %y_n2(i) = (2*cos(w02))*y_n2(i-1) - y_n2(i-2) + x_n(i) - (cos(w02))*x_n(i-1);
end

subplot(1,2,1)
stem(0:N-1, output)
xlabel('n')
ylabel('y[n] with freq 1kHz')
grid on

