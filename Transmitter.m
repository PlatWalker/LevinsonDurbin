clear;

%% Audio read 

Fs = 11025;
numberOfSamplesToGet = [1,20*Fs];
[samples,Fs1] = audioread('nagranie.wav', numberOfSamplesToGet, 'native');

%% Algorithm and segmentation

THICKseg = MakeSegments(samples);

for i = 1:size(THICKseg,2)
    
    seg = FlattenSegments( THICKseg(:,i) );
    
    a(:,i) = LevinsonDurbin( seg )';
    
    e(:,i) = ErrorVector( a(:,i), seg );
    
    emax(i) = max(e(:,i));
    quants = quantizeErorr( e(:,i), emax(i), 4 );
    
end

%% write to bin file

fileWsp = fopen('Wsp.bin','w');
fileEmax = fopen('emax.bin','w');
fileQuants = fopen('quants.bin','w');
fwrite(fileWsp,a);
fwrite(fileEmax,emax);
fwrite(fileQuants,quants);
fclose(fileWsp);
fclose(fileEmax);
fclose(fileQuants);




