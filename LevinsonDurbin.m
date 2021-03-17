function [ a , p ] = LevinsonDurbin( seg )

N = 256;
matInd = 1; % matlab indexing starts from 1... math starts indexing from 0. 
            % So adding always this for clear math view of vectors.

%% Estimated autocorrelation coefficients

p = zeros(10 + matInd,1);

for i = 0:10
    for t = i+1:N
        p(i+matInd) = p(i+matInd) + seg(t)*seg(t-i)/256;
    end
end

%% First step for i = 1

a = zeros(10,10);

s(0 + matInd) = p(0 + matInd); 

k(1) = p(1 + matInd)/p(0 + matInd);
a(1,1) = k(1); % a vector dont have 0 index in math notation so mathInd is not needed
s(1 + matInd) = (1-k(1)^2)*s(0 + matInd);

%% Recursion steps

x = 0;

for i = 2:10

    for j = 1:i-1
        
        x = x + a(j,i-1) * p(i-j + matInd);
        
    end
    
    k(i) = (p(i + matInd) - x) / s(i - 1 + matInd);
    a(i,i) = k(i);
    
    for j = 1:i-1
        
        a(j,i)= a(j,i-1) - k(i) * a(i-j,i-1);
        
    end
    
    s(i + matInd) = (1-k(i)^2) * s(i - 1 + matInd);
    
end


end

