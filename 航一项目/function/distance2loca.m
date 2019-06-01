function [lon,lat,height] = distance2loca(lon1,lat1,height1,lon2,lat2,height2,distance_WithH,sum_distance,sum_distance_NoH)
%lon1 lat1 height1�յ㾭γ�� lon2 lat2 height2��㾭γ�� distance ����������
%����ֵlon lat height��γ��
%distance_WithHĿ������ sum_distance Ŀ�굽�յ���� sum_distance_NoHĿ�굽�յ���루����߶ȣ�
%sum_distance = distance(lat1,lon1,lat2,lon2) /180*pi*6371004
scale = distance_WithH/sum_distance;
cos_c = cos((90-lat1)/180*pi)*cos((90-lat2)/180*pi) + sin((90-lat1)/180*pi)...
    *sin((90-lat2)/180*pi)*cos((lon1-lon2)/180*pi);
sin_c = sqrt(1-cos_c^2);
height = (height1-height2)*scale + height2;

distance_nohei= scale * sum_distance_NoH;

A = asin(sin((90-lat1)*pi/180)*sin((lon1-lon2)/180*pi)/sin_c);
A = A/pi *180;


if(lon1>=lon2&&lat1>=lat2)
    Azimuth = A;
elseif(lon1<lon2&&lat1>=lat2)
    Azimuth = A+360;
else
    Azimuth = 180-A;
end

arc = distance(lat1,lon1,lat2,lon2);%����

dis = arc*pi/180*6371000; %���������


c = distance_nohei/6371004;

a = acos(cos((90-lat2)*pi/180)*cos(c) + sin((90-lat2)*pi/180)*sin(c)*cos...
    (Azimuth*pi/180));

C = asin(sin(c)*sin(Azimuth));

a = a*180/pi;
lon = lon2+C;
lat = 90 - a;




