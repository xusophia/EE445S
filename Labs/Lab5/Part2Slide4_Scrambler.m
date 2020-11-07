
%%  design raised cosine filter
B = rcosdesign(1, 8, 20, 'normal');

%%

T = 2000;
data = [-15000, 15000];
x = zeros(1,8);
samplesPerSymbol = 20;


output = zeros(1,T);
cosine = int32([1 0 -1 0]);
counter = 0;
symbol = 0;
state = uint32(2);
for t = 1:T    
   if counter == 0 
%        symbol = randi([-1,1]); 
%         symbol = mod((symbol + 1), 2);
        [symbol,state] = SSRG_update(state);

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


prefiltered_output = filter(num_pre_filter, den_pre_filter, output);
squared = prefiltered_output.^2;
recovered_clock = filter(num_bp, den_bp, squared);
yyaxis left
hold on;
stem(1:T, recovered_clock, '.-') % blue 
yyaxis right
stem(1:T, output, '.-') % red




function[new,state] = SSRG_update(state)
   value2bit = bitand(bitshift(state,-1),1);
   value5bit = bitand(bitshift(state,-4),1);
   new = bitxor(value2bit,value5bit);
   state = bitor(bitshift(state,1),new);
end
