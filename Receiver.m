fileWsp = fopen('Wsp.bin');
fileEmax = fopen('emax.bin');
fileQuants = fopen('quants.bin');

kekWsp = fread(fileWsp, 'double');
kekEmax = fread(fileEmax, 'double');
kekQuants = fread(fileQuants, 'double');

fclose(fileWsp);
fclose(fileEmax);
fclose(fileQuants);