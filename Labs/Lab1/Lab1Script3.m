profile on -timer cpu
A = rand(5000);
B = rand(5000);
C = mult(A, B);

profile off 
profile viewer 

function m = mult(x, y)
    m = x*y;
end