function geomag_field = create_geomag(LLH)
%CREATE GEOMAG �˴���ʾ�йش˺�����ժҪ
% LLHΪ����ľ�γ�������ļ�
%   �˴���ʾ��ϸ˵��
geomag_field = [];
for i = 1:size(LLH,1)
[XYZ, H, DEC, DIP, F] = wrldmagm(LLH(i,3), LLH(i,2), LLH(i,1), decyear(2015,7,4),'2015');
geomag_field = [geomag_field;F];
end
end

