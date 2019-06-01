function [pitch,roll,yaw] = calculatePRY(length,x,Yaw)
%CALCULATEPRY 此处显示有关此函数的摘要
    % length为数据长度
    % x为噪声大小
    % 还没有设定yaw角根据方向不同，值不同
%   此处显示详细说明;
pitch = zeros(length,1);
roll = zeros(length,1);
yaw = [];
for i = 1:length
    yaw = [yaw;Yaw];
end
%为数据添加噪声
pitch = addAwgn(pitch,x);
roll = addAwgn(roll,x);
yaw = addAwgn(yaw,x);
end

