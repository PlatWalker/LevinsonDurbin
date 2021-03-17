function [ flatSeg ] = FlattenSegments( seg )

w = @(k) 0.5*(1-cos((2*pi*k)/257));

for i = 1:size(seg,1)
    for j = 1:size(seg,2)
        
        flatSeg(i,j) = seg(i,j) * w(i);
        
    end
end

%%
Zeros = zeros(10,size(flatSeg,2));

flatSeg = [Zeros;flatSeg;Zeros];

end

