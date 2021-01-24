T = 200;
data = [-15000, 15000];
x = zeros(1,10);
samplesPerSymbol = 20;

output = zeros(1,T);
cosine = int32([1 0 -1 0]);
counter = 0;

B = rcosdesign(1, 8, 20, 'normal');
for t = 1:T    
   if counter == 0 
       symbol = randi([0,1]); 
       x(1) = data(symbol+1);
   end 
   y = 0;

   for i = 0:9
       y = y + x(i+1) * B(counter + samplesPerSymbol*i + 1);
   end
   
   if counter == (samplesPerSymbol -1)
       counter = -1;
       
       for i = 9:-1:1
           x(i+1) = x(i);
       end
   end
   
   counter = counter + 1;
   
   output(t) = y*cosine(mod(t,4)+1);  
   
end

stem(1:T, output, '.-')

clear all
T = 100;
PN = zeros(1,T);
states = zeros(1,T);
state = uint32(2);

DS_state = uint32(2);
DD_state = uint32(5);
scrambler = zeros(1, T);
descrambler = zeros(1, T);

% n = 100; % Total length must be even to have even # of 0s and 1s.
% numberOfOnes = n/2;
% % Get a list of random locations, with no number repeating.
% indexes = randperm(n);
% % Start off with all zeros.
% x = zeros(1, n);
% % Now make half of them, in random locations, a 1.
% x(indexes(1:numberOfOnes)) = 1;

x = randi([0, 1], [1,100]); % generate a random sequence

for t = 1:T
   % states(t) = state;
   [new,DS_state] = SSRG_update(x(t), DS_state);
   scrambler(t)=new;
   
end
% disp(x)

for t = 1:T
   % states(t) = state;
   [new,DD_state] = SSRG_update(scrambler(t), DD_state);
   descrambler(t)=new;
   
end


function[new,state] = SSRG_update(in, state)
   value2bit = bitand(bitshift(state,-1),1);
   value5bit = bitand(bitshift(state,-4),1);
   new = bitxor(value2bit,value5bit);
   state = bitor(bitshift(state,1),new);
   new = bitxor(new, in);
end