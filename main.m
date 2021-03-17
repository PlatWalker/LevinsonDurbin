clear;

%%
Fs = 11025;
numberOfSamplesToGet = [1,20*Fs];
[samples,Fs1] = audioread('nagranie.wav', numberOfSamplesToGet, 'native');

THICKseg = MakeSegments(samples);

seg = FlattenSegments(THICKseg); 


for i = 1:1 %size(THICKseg,2)
    
    [a,p] = LevinsonDurbin( THICKseg(:,i) );
    e = ErrorVector( a, seg(:,i) );
    
end









