clear
close all
clc
rng(1)


%%
ALPHA = 1;
TRUNCATION = 8;
UPSAMPLE = 20;


B = rcosdesign(ALPHA,TRUNCATION,UPSAMPLE,'normal');

T = 200;
scale = 15000;
% 
% SYMBOLS = [scale, scale; ...
%            scale, -scale; ...
%            -scale, scale; ...
%            -scale, -scale;];

%            
%            
SYMBOLS = [3*scale, scale;...
           scale, 3*scale;...
           3*scale, -scale;...
           -scale, 3*scale;...
           -3*scale, scale;...
           scale, -3*scale;...
           -3*scale, -scale;...
           -scale, -3*scale;...
           3*scale, 3*scale;...
           scale, scale;...
           3*scale, -3*scale;...
           scale, -scale;...
           -3*scale, 3*scale;...
           -scale, scale;...
           -3*scale, -3*scale;...
           -scale, -scale];
           
% first col is symbol val for in-phase
% second col is for quadature phase
            
xI = zeros(1,TRUNCATION);
xQ = zeros(1,TRUNCATION);
output = zeros(1,T);
cosine = int32([1 0 -1 0]);
sine = int32([0 1 0 -1]);

counter = 0;

for t = 1:T    
   if counter == 0        
       index = randi([1,16]); 
       xI(1) = SYMBOLS(index,1); % generation of symbol
       xQ(1) = SYMBOLS(index, 2);
   end 
   yQ = 0;
   yI = 0;
   
   % Applying transmit filter
   for i = 0:TRUNCATION-1
       yI = yI + xI(i+1) * B(counter + UPSAMPLE*i + 1);
       yQ = yQ + xQ(i+1) * B(counter + UPSAMPLE*i + 1);
   end
   
   if counter == (UPSAMPLE -1)
       counter = -1;
       
       for i = TRUNCATION:-1:1 % truncation = num of zero crossings
           xI(i+1) = xI(i);
           xQ(i+1) = xQ(i);
       end
   end
   
   counter = counter + 1;
   
%    if cosine(mod(t,4)+1) == 0
%        output(t) = - yQ*sine(mod(t,4) + 1);
%    else
%        output(t) = yI*cosine(mod(t,4) + 1);
%    end
    output(t) = yI*cosine(mod(t,4) + 1) - yQ*sine(mod(t,4) + 1);
 end

stem(1:T, output, '.-')