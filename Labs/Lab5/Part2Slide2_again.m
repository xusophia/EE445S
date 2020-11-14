filter_1 = rcosdesign(1, 8, 20, 'normal');
random_2000 = rand(1, 2000);
random_2000 = round(random_2000);

random_2000 = 2*random_2000 - 1;
random_2000_up = upsample(random_2000, 20);
convolved = conv(filter_1, random_2000_up);
N = length(convolved);

sampled = zeros(1, 2000);
i = 1;

for n = 81:20:(N-80)
    sampled(i) = convolved(n);
    i = i + 1;
end

numberWrong = 0;
sampled = sign(sampled);
for i = 1:2000
    if sampled(i) ~= random_2000(i)
        numberWrong = numberWrong + 1;
    end  
end

disp(isequal(sampled, random_2000));

disp('Error Probability:')
disp(numberWrong/2000)