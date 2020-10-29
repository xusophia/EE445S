N = 31;
R = zeros(1, 2*N);

x = randi([0, 1], [1,100]); % generate a random sequence

temp = 0;

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

for i = 1:T
    if PN(i) == 0
        PN(i) = -1;
    end
end

for n = 1:2*N
    temp = 0;
    for k = 1:N
        temp = PN(k)*PN(n+k-1) + temp;
    end
    disp(temp)
    R(n) = temp * (1/N);
end

stem(0:61, R)

for i = 1:T
    if scrambler(i) == 0
        scrambler(i) = -1;
    end
end

for n = 1:2*N
    temp = 0;
    for k = 1:N
        temp = scrambler(k)*scrambler(n+k-1) + temp;
    end
    disp(temp)
    R(n) = temp * (1/N);
end

plot(0:61, R)


function[new,state] = SSRG_update(state)
   value2bit = bitand(bitshift(state,-1),1);
   value5bit = bitand(bitshift(state,-4),1);
   new = bitxor(value2bit,value5bit);
   state = bitor(bitshift(state,1),new);
end