%% read bin files

fileWsp = fopen('Wsp.bin');
fileEmax = fopen('emax.bin');
fileQuants = fopen('quants.bin');

wsp = fread(fileWsp, [10 861], 'double');
emaxR = fread(fileEmax, 'double');
quantsR = fread(fileQuants, [256 861], format); % format is precision in which we write/read

fclose(fileWsp);
fclose(fileEmax);
fclose(fileQuants);

%% signal reconstruction

quantizationLevel = (max(max(quantsR)) + 1); % read quantization level from data

y = zeros(220500,1);

for i = 1:861
    
    quantStep = (emaxR(i) - (-emaxR(i)))/(quantizationLevel-1);
    partition = -emaxR(i):quantStep:emaxR(i);
    
    for k = 1:256
        
        x = 0;
        for r = 1:10
            
            if k - r > 0
                
                x = x + wsp(r,i)*y(k-r);
                
            end
            
        end
        
        y((i-1)*256 + k) = - x + partition(quantsR(k,i) + 1);
        
    end   
end

y = int16(y);
received = audioplayer(y, 11025);
saveFormat = sprintf('received%d.wav', quantLevelGiven);
audiowrite(saveFormat, y, 11025);

plot(1:220500, y, 1:220500, samples)
legend('recreated','orginal')
xlabel('Sample[n]') 
ylabel('Aplitude[dB]')
xlim([1 220500])
ylim([-10000 7000])



