clear;

%%

Fs = 11025;
numberOfSamplesToGet = [1,20*Fs];
[samples,Fs1] = audioread('nagranie.wav', numberOfSamplesToGet, 'native');

THICKseg = MakeSegments(samples);

for i = 1:1 %size(THICKseg,2)
    
    seg = FlattenSegments( THICKseg(:,i) );
    
    a = LevinsonDurbin( seg );
    
    e = ErrorVector( a, seg );
    
end

emax = max(e);

quantStep = (emax - (-emax))/256 ;

partition = -emax:quantStep:emax ;

codebook = [-emax-quantStep partition];

[ index, quants ] = quantiz( e', partition, codebook' );

fileWsp = fopen('Wsp.bin','w');
fileEmax = fopen('emax.bin','w');
fileQuants = fopen('quants.bin','w');
fwrite(fileWsp,a);
fwrite(fileEmax,emax);
fwrite(fileQuants,quants);
fclose(fileWsp);
fclose(fileEmax);
fclose(fileQuants);




