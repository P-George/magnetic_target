function [fil] = filter_bandpass_index(sig)

[high_b, high_a] = butter(6, 0.04/5, 'high');
[low_b, low_a] = butter(4, 0.6/5, 'low');

BFHP0 = 0.9980499222938581;
BFHP1 = -1.9960998445877161;
BFHP2 = 0.998049922238581;
AFHP1 = 1.9960983216843922;
AFHP2 = -0.9961013674910398;
sos = [BFHP0, BFHP1, BFHP2, 1, -AFHP1, -AFHP2];
Hd_hp = dfilt.df2sos(sos);

signal = sig;
doublesignal = [flipud(signal);signal];
filtsignal = filter(Hd_hp, doublesignal);
filtsignal = filter(low_b, low_a, filtsignal);
filtsignal = filter(high_b, high_a, filtsignal);
filtsignal = filtsignal(length(signal)+1:end, :);
fil = filtsignal;