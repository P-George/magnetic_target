function [LL,LLH,Y] = calculateDistance(Lon_A,Lat_A,Hei_A,Lon_B,Lat_B,Hei_B)
%CALCULATEDISTANCE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%   ͨ����γ��ȷ������֮��ľ���
%   ��������� A�㾭γ�� B�㾭γ��

[LL,Y] = distance(Lat_A,Lon_A,Lat_B,Lon_B);
LL =  LL/180*pi*6371004;
H = abs(Hei_B-Hei_A);
LLH = sqrt(LL^2 +H^2);
    
end

