clear;

%Pytanka:
% O co chodzi z tymi zerami ? dobrze mysle?
% Czy algorytm dla pierwszych krokow nie zglupieje, jesli miej¹c na
% poczatku sa same zera?

%%
Fs = 11025;
numberOfSamplesToGet = [1,20*Fs];
[samples,Fs1] = audioread('nagranie.wav', numberOfSamplesToGet, 'native');

[ THICKseg ] = MakeSegments(samples);

%[ seg ] = FlattenSegments(THICKseg); 

for i = 1:1 %size(THICKseg,2)
    
    [ p ] = LevinsonDurbin( THICKseg(:,i) );
    
end









