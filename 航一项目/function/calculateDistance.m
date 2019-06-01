function [LL,LLH,Y] = calculateDistance(Lon_A,Lat_A,Hei_A,Lon_B,Lat_B,Hei_B)
%CALCULATEDISTANCE 此处显示有关此函数的摘要
%   此处显示详细说明
%   通过经纬高确定两点之间的距离
%   输入参数： A点经纬高 B点经纬高

[LL,Y] = distance(Lat_A,Lon_A,Lat_B,Lon_B);
LL =  LL/180*pi*6371004;
H = abs(Hei_B-Hei_A);
LLH = sqrt(LL^2 +H^2);
    
end

