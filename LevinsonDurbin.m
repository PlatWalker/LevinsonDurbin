function [ p ] = LevinsonDurbin( seg )

N = 256;


%% Estimated autocorrelation coefficients

p = zeros(11,1);

for i = 0:10
    for t = i+1:N
        p(i+1) = p(i+1) + seg(t)*seg(t-i);
    end
end

%% Yule-Walker equations pL*a = pP

for i = 2:11
    pP(i) = p(i); 
end
    
for i = 1:10
    pL(i) = p();
end


end

