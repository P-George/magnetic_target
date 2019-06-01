function [bpsig] = filter_bandpass_calibration(sig)

%  ������У׼ʱʹ�õĴ�ͨ�˲���
%  ���ȹ�һ��0.02Hz��ͨ��Ȼ���0.04-1�Ĵ�ͨ����0.06-0.6�Ĵ�ͨ
%  ���ú���
%  �ú�����ԭbpf_cal����һ��
%
%  ���£�
%  ϵ�����ļ��ж�ȡ
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