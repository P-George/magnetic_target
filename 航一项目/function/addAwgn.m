function y = addAwgn(single,x)
%ADDAWGN �˴���ʾ�йش˺�����ժҪ
    % Ϊ�ź���Ӱ�����
    % single ΪҪ����������ź�
    % x Ϊ�����İٷֱ� x=2��ʾ��Ӱٷ�֮��������
%   �˴���ʾ��ϸ˵��
SNR = 20*log(100/x); %��ֵ 2%����
y  = awgn(single,SNR);
end

