function [ quants ] = quantizeErorr( e, emax, quantLevel )

quantStep = (emax - (-emax))/(quantLevel-1);
partition = -emax:quantStep:emax;
codebook = 0:quantLevel;
[ ~, quants ] = quantiz( e', partition, codebook' );


end

