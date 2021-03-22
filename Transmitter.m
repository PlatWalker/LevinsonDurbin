clear;

m = 2;
quantLevelGiven = 2^m;
format = sprintf('ubit%d', quantLevelGiven); % format is precision in which we write/read

%% Audio read 

Fs = 11025;
numberOfSecond = 20;
numberOfSamplesToGet = [1, numberOfSecond*Fs];
[samples,Fs1] = audioread('record.wav', numberOfSamplesToGet, 'native');

%% Algorithm and segmentation

[THICKseg, numberOfSegments] = MakeSegments(samples);

a = zeros(10, numberOfSegments );
e = zeros(256, numberOfSegments );
emax = zeros(1, numberOfSegments );
quants = zeros(256, numberOfSegments );

for i = 1:numberOfSegments
    
    seg = FlattenSegments( THICKseg(:,i) );
    
    a(:,i) = LevinsonDurbin( seg )';
    
    e(:,i) = ErrorVector( a(:,i), THICKseg(:,i) );
    
    emax(i) = max(abs(e(:,i)));
    quants(:,i) = quantizeErorr( e(:,i), emax(i), quantLevelGiven );
    
end

%% Write to bin file

fileWsp = fopen('wsp.bin', 'w');
fileEmax = fopen('emax.bin', 'w');
fileQuants = fopen('quants.bin', 'w');

fwrite(fileWsp, a, 'double');
fwrite(fileEmax, emax,  'double');
fwrite(fileQuants, quants, format);

fclose(fileWsp);
fclose(fileEmax);
fclose(fileQuants);

Receiver;


