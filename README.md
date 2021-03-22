# LevinsonDurbin
Creating AR model of voice signal with help of Levinson-Durbin algorithm.

Start script transmitter. It will create three .bin files. Quantized error, AR model coefficients and max error. 
It is needed for encrypting voice signal by receiver. Project consist four recordings. "record.wav" is orginal record. 
"received4.wav", "received8.wav", "received16.wav"  is recreated signal from autoregression model where number next to it's name 
means level of quantization used in this file for coding error.
