function [Init_matrix] = position_to_init(height, lon, lat, R)

%经纬高变换到初始坐标系
%输入变量：height, lon, lat,高经纬；R，地球半径
%输出变量：Init_matrix，初始坐标系中的坐标

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