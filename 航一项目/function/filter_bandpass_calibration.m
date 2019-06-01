function [bpsig] = filter_bandpass_calibration(sig)

%  用于在校准时使用的带通滤波器
%  首先过一道0.02Hz高通，然后过0.04-1的带通，或0.06-0.6的带通
%  常用后者
%  该函数与原bpf_cal函数一致
%
%  更新：
%  系数从文件中读取
%  Guanyi Zhao  2018.06.14  13:55:41

hp = load('./filter/highpass_fir_10_006.txt');
lp = load('./filter/lowpass_fir_10_06.txt');

sos = load('./filter/highpass_iir_10_002.txt');
Hd = dfilt.df2sos(sos);

[len,~] = size(sig);
fsig = [flipud(sig);sig];
fsig = filter(Hd, fsig);
fsig = filter(hp,1,fsig);
fsig = filter(lp,1,fsig);

bpsig = fsig(len+1:end,1:end);
end