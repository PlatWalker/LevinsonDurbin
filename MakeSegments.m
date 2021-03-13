function [ seg ] = MakeSegments( sample )

dzielnik = round(size(sample,1)/256);

seg = zeros(256, dzielnik);

for col = 1:dzielnik

    seg(:,col) = sample(1+246*(col-1):256+246*(col-1),1);
    
end

end

