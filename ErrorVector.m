function [ e ] = ErrorVector( a , seg )

e = zeros(256,1);

for i = 11:size(seg,1) - 10
    for j = 1:10
        
        e(i-10) = e(i-10) + a(j)*seg(i-j);
        
    end
end

