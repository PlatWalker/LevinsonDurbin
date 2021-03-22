function [ e ] = ErrorVector( a , seg )

e = zeros(256,1);

for i = 1:size(seg,1)
    
    e(i) = seg(i);
    for j = 1:10
        if i - j > 0
            
            e(i) = e(i) + a(j)*seg(i-j);
            
        end
    end
end

