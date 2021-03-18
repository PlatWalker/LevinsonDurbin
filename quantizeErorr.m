function [ quants ] = quantizeErorr( e, emax, quantLevel )

quantStep = (emax - (-emax))/quantLevel ;
partition = -emax:quantStep:emax ;
codebook = [-emax-quantStep partition];
[ ~, quants ] = quantiz( e', partition, codebook' );


end

