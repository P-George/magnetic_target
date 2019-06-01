function [Init_matrix] = move_to_init(Move_matrix, Xg, Yg, Zg, lat, lon)
%Move_matrix: 3*N matrix
%Xg: scalar
%Yg: scalar
%Zg£ºscalar
%lat: deg, scalar
%lon: deg, scalar
%Init_matrix: 3*N
lat_rad = deg2rad(lat);
lon_rad = deg2rad(lon);

[~, col] = size(Move_matrix);

L1 = ones(1,col)*Xg;
L2 = ones(1,col)*Yg;
L3 = ones(1,col)*Zg;
XYZg = [L1; L2; L3];

LOM = [1, 0, 0; 0, cos(lon_rad), -sin(lon_rad); 0, sin(lon_rad), cos(lon_rad)];
LAM = [cos(lat_rad), 0, -sin(lat_rad); 0, 1, 0; sin(lat_rad), 0, cos(lat_rad)];

Init_matrix = XYZg + LAM*LOM*Move_matrix;
end