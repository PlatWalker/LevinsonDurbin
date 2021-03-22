clear;

%% Audio read 

Fs = 11025;
numberOfSecond = 20;
numberOfSamplesToGet = [1, numberOfSecond*Fs];
[samples,Fs1] = audioread('nagranie.wav', numberOfSamplesToGet, 'native');

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
    
    emax(i) = max(e(:,i));
    quants(:,i) = quantizeErorr( e(:,i), emax(i), 16 ); % 4, 8, 16 bitowa kwantyzacja
    
end

%% Write to bin file

fileWsp = fopen('Wsp.bin', 'w');
fileEmax = fopen('emax.bin', 'w');
fileQuants = fopen('quants.bin', 'w');
fwrite(fileWsp, a, 'double');
fwrite(fileEmax, emax,  'double');
fwrite(fileQuants, quants, 'double');
fclose(fileWsp);
fclose(fileEmax);
fclose(fileQuants);

Receiver;


