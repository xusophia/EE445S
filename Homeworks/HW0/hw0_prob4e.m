function stepfun = hw0_prob4e(t,to) 
%STEPFUN  Unit step function. 
%	STEPFUN(T,T0), where T is a monotonically increasing vector, 
%	returns a vector the same length as T with zeros where T < T0 
%	and ones where T >= T0. 
 
%	J.N. Little 6-3-87 
%	Copyright (c) 1986-93 by the MathWorks, Inc. 
 
[m,n] = size(t); 
y = zeros(m,n); 
i = find(t>=to); 
if isempty(i) 
	return 
end 
i = i(1); 
if m == 1 
	y(i:n) = ones(1,n-i+1); 
else 
	y(i:m) = ones(m-i+1,1); 
end 



