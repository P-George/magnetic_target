function [pitch,roll,yaw] = calculatePRY(length,x,Yaw)
%CALCULATEPRY �˴���ʾ�йش˺�����ժҪ
    % lengthΪ���ݳ���
    % xΪ������С
    % ��û���趨yaw�Ǹ��ݷ���ͬ��ֵ��ͬ
%   �˴���ʾ��ϸ˵��;
pitch = zeros(length,1);
roll = zeros(length,1);
yaw = [];
for i = 1:length
    yaw = [yaw;Yaw];
end
%Ϊ�����������
pitch = addAwgn(pitch,x);
roll = addAwgn(roll,x);
yaw = addAwgn(yaw,x);
end

