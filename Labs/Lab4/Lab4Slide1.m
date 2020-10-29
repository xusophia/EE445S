clear all
T = 100;
PN = zeros(1,T);
states = zeros(1,T);
state = uint32(2);

for t = 1:T
   % states(t) = state;
   [new,state] = SSRG_update(state);
   PN(t)=new;
   disp(state)
   
end

stem(1:T,PN);

function[new,state] = SSRG_update(state)
   value2bit = bitand(bitshift(state,-1),1);
   value5bit = bitand(bitshift(state,-4),1);
   new = bitxor(value2bit,value5bit);
   state = bitor(bitshift(state,1),new);
end