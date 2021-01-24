clear
close all
clc

B = rcosdesign(0.125, 8, 20, 'normal');

T = 200;
data = [-15000, 15000];
x = zeros(1,10);
samplesPerSymbol = 20;

DS_state = uint32(5);
x = randi([0, 1], [1,200]); % generate a random sequence
% for t = 1:T
%    states(t) = state;
%    [new,DS_state] = SSRG_update(x(t), DS_state);
%    scrambler(t)=new;
%    
% end

output = zeros(1,T);
cosine = int32([1 0 -1 0]);
counter = 0;

for t = 1:T    
   if counter == 0 
       [symbol, DS_state] = SSRG_update(x(t), DS_state);
       x(1) = data(symbol+1);
   end 
   y = 0;
   
   for i = 0:7
       y = y + x(i+1) * B(counter + samplesPerSymbol*i + 1);
   end
   
   if counter == (samplesPerSymbol -1)
       counter = -1;
       
       for i = 7:-1:1
           x(i+1) = x(i);
       end
   end
   
   counter = counter + 1;
   
    output(t) = y; 
   
end

stem(1:T, output, '.-')

function[new,state] = SSRG_update(in, state)
   value18bit = bitand(bitshift(state,-17),1);
   value23bit = bitand(bitshift(state,-22),1);
   new = bitxor(value18bit,value23bit);
   state = bitor(bitshift(state,1),new);
   new = bitxor(new, in);
end

