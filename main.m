clear;

%%

Fs = 11025;
numberOfSamplesToGet = [1,20*Fs];
[samples,Fs1] = audioread('nagranie.wav', numberOfSamplesToGet, 'native');

THICKseg = MakeSegments(samples);

for i = 1:1 %size(THICKseg,2)
    
    seg = FlattenSegments(THICKseg(:,i));
    [a,p] = LevinsonDurbin( seg(:,i) );
    e = ErrorVector( a, seg(:,i) );
    
end









