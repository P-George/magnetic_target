function [Init_matrix] = position_to_init(height, lon, lat, R)

%��γ�߱任����ʼ����ϵ
%���������height, lon, lat,�߾�γ��R������뾶
%���������Init_matrix����ʼ����ϵ�е�����

%height, col
%lon: deg, col, 
%lat: deg, col,
%R: scalar
%Init_matrix: 3*N
lon_rad = deg2rad(lon);
lat_rad = deg2rad(lat);

X = (R+height).*sin(lat_rad);
Y = (R+height).*cos(lat_rad).*sin(lon_rad);
Z = -(R+height).*cos(lat_rad).*cos(lon_rad);

Init_matrix = [X'; Y'; Z';];
end