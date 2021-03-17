function [ flatSeg ] = FlattenSegments( seg )

w = @(k) 0.5*(1-cos((2*pi*k)/257));

flatSeg = zeros(size(seg));

for i = 1:size(seg,1)
    for j = 1:size(seg,2)
        
        flatSeg(i,j) = seg(i,j) * w(i);
        
    end
end

% flatSeg = seg .* hamming(256);

%%
Zeros = zeros(10,size(flatSeg,2));

flatSeg = [Zeros;flatSeg;Zeros];

end

