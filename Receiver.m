%% read bin files

fileWsp = fopen('Wsp.bin');
fileEmax = fopen('emax.bin');
fileQuants = fopen('quants.bin');

kekWsp = fread(fileWsp,[10 861], 'double');
kekEmax = fread(fileEmax, 'double');
kekQuants = fread(fileQuants, 'double');

fclose(fileWsp);
fclose(fileEmax);
fclose(fileQuants);

%% signal reconstruction

y = zeros(220500,1);

for i = 1:861
    for k = 1:256
        
        x = 0;
        for r = 1:10
            
            if k - r > 0
                
                x = x + a(r,i)*y(k-r);
                
            end
            
        end
        
        y((i-1)*256 + k) = - x + e(k,i);
        
    end   
end

received = audioplayer(y,Fs1,16);
audiowrite('odebrany.wav',y,Fs1);

plot(1:220500, y, 1:220500, samplesDouble)





