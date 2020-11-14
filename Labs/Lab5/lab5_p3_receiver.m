%% Define the header sequence
pn_seq = reshape([...
1,1,0,1,1,0,0,0,1,0,1,0,0,0,1,0,0,1,1,0,0,1,0,0,0,0,0,1,1,0,1,0
0,1,0,0,1,1,1,1,0,1,1,1,1,1,0,0,0,1,0,1,0,1,0,1,1,0,1,0,0,0,0,1
0,1,0,0,0,0,0,0,0,1,0,1,1,0,1,1,0,1,1,1,1,0,0,1,1,1,1,0,0,0,1,0
0,0,1,1,1,1,1,1,0,1,1,0,0,0,1,1,1,0,1,0,1,1,0,1,0,1,0,0,0,0,1,1
0,0,1,1,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,0,1
0,1,1,1,0,1,0,1,1,1,1,0,0,0,0,1,0,1,0,1,0,0,1,0,0,0,0,1,0,1,1,0
0,1,0,0,1,1,0,0,0,0,0,1,0,0,0,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0
0,0,0,1,0,0,1,0,0,1,0,0,1,1,0,1,0,0,1,1,0,1,0,1,1,1,1,1,0,0,1,1
0,0,0,1,1,1,1,1,0,0,1,0,0,0,1,1,1,0,1,1,1,1,1,1,0,0,0,0,1,1,1,0
0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,1,0,0,1,1,1,0
1,1,0,0,1,0,1,0,1,1,1,0,1,1,1,1,0,1,0,1,0,0,0,1,1,1,1,0,1,0,0,1
0,1,0,1,0,0,0,0,0,1,0,1,1,1,1,1,1,1,1,0,1,0,1,0,1,0,1,0,1,1,1,1
0,1,0,0,0,0,1,1,1,0,1,0,0,1,0,0,0,1,1,0,0,1,0,1,1,0,1,0,1,1,0,0
1,1,1,1,0,1,0,1,1,0,0,0,1,1,0,0,1,1,1,1,1,1,0,0,1,0,1,0,1,0,1,0
0,1,1,0,0,1,1,0,0,1,0,1,0,0,1,1,1,1,1,0,1,0,0,1,1,1,0,0,0,0,1,0
0,0,1,1,0,1,1,0,0,1,0,0,0,1,0,1,0,0,1,1,0,1,1,1,1,0,1,1,1,0,1,0
1,0,1,1,1,0,0,1,1,0,0,1,1,1,0,1,1,1,0,1,1,1,0,0,1,1,1,0,1,0,1,0
0,1,1,1,0,1,0,0,0,0,0,1,1,1,1,0,1,1,0,1,1,1,0,0,0,0,1,1,0,0,0,1
0,0,1,0,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,0,1,0,0,0,1,0,1,1,0,1,0,0
1,0,1,1,1,0,1,0,0,1,1,0,0,0,1,0,1,1,0,0,0,0,0,0,1,0,1,0,0,1,0,0
1,0,1,1,1,1,1,0,1,1,1,1,0,0,0,1,1,0,0,0,1,1,0,1,1,1,0,1,1,0,0,0
0,1,1,1,1,0,0,1,0,0,1,1,1,0,0,1,0,1,1,0,0,0,1,0,0,0,0,1,1,0,1,1
1,1,1,1,1,0,0,1,1,1,0,0,0,1,1,0,1,0,1,0,0,1,0,1,0,0,0,0,1,0,0,0
0,1,0,0,1,0,1,1,0,1,1,1,1,1,0,1,0,1,1,1,0,0,0,1,0,1,1,1,0,0,1,0
0,0,0,1,1,1,1,1,0,1,1,0,1,0,1,0,1,0,0,0,1,0,1,1,1,1,0,1,1,0,0,1
1,1,0,0,1,1,1,1,1,0,0,0,0,0,1,1,1,0,0,1,0,0,1,0,1,0,1,1,0,0,1,0
1,1,1,1,0,0,1,0,1,1,1,0,0,0,0,0,1,0,1,0,1,1,0,1,1,0,0,1,1,0,0,0
0,1,1,0,1,0,1,1,0,1,1,1,0,1,0,0,0,1,0,1,0,1,1,1,1,1,1,0,1,0,0,0
1,1,1,0,0,1,1,0,1,1,1,0,0,1,0,1,0,0,0,1,1,0,1,0,0,0,0,0,0,1,1,0
0,1,0,0,1,0,0,0,1,0,0,0,0,0,1,0,0,1,1,0,1,1,0,1,0,0,1,1,1,1,0,0
1,1,0,1,0,1,0,1,1,0,0,0,0,1,0,1,1,1,0,1,1,0,1,0,0,0,1,1,0,0,0,0
1,0,0,1,1,1,1,1,1,1,0,1,1,1,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,1,0,1],[1,1024]);
header = 2*pn_seq - 1;

%% Upsample and apply the pulse shaping and modulation to the header
fs = 48000;
f0 = 5000;
alpha = 1;
L = 20;
h = rcosdesign(alpha,8,L,'normal');
y_header = conv(h,upsample(header,20));
len  = (128^2 + 1024)*L + 160;
t = 1:len;
carrier = cos(t*2*pi*f0/fs); 

%% Load the received signal and correlate with the header to offset
load RX;
r = xcorr(y_header.*carrier(1:length(y_header)), RX);
[val,ind] = max(r);
offset = length(RX) - ind;
RX = RX(offset:offset + len-1);

%% Demodulate, apply the matched filter, and downsample
rx = conv(h,RX.*carrier); % downconversion and then LPF
GD = (length(h)-1)/2;
x_recovered = 2*(rx(2*GD+1:L:end-2*GD)>0)-1;
data_recovered = x_recovered(1025:end);

%% Multiply with the same random sequence to descramble the data
rng('default'); scrambler = 2*randi(2,1,length(data_recovered))-3;
data_recovered = (data_recovered.*scrambler) > 0;

%% convert the sequence of bits back into an image for viewing
img = (reshape(data_recovered,[128,128]));
figure; imshow(img)
imwrite(img,'received.png');

