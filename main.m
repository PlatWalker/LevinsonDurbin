clear;

%Pytanka:
% 1. O co chodzi z tymi zerami ? dobrze mysle?
% 2. Czy algorytm dla pierwszych krokow nie zglupieje, jesli miej¹c na
% poczatku sa same zera?
% 3. czy dzielenie przez sigme jest element-wise

%%
Fs = 11025;
numberOfSamplesToGet = [1,20*Fs];
[samples,Fs1] = audioread('nagranie.wav', numberOfSamplesToGet, 'native');

[ THICKseg ] = MakeSegments(samples);

[ seg ] = FlattenSegments(THICKseg); 

for i = 1:1 %size(THICKseg,2)
    
    [ a ] = LevinsonDurbin( seg(:,i) );
    [ e ] = ErrorVector( a );
end









