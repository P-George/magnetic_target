function [Pos_matrix] = init_to_position(Init_matrix, R)
%R: scalar
%Init_matrix: 3*N
%Pos_matrix: 3*N
X = Init_matrix(1,1:end);
Y = Init_matrix(2,1:end);
Z = Init_matrix(3,1:end);

height = sqrt(X.*X + Y.*Y + Z.*Z) - R;
lat = rad2deg(asin(X./sqrt(X.*X + Y.*Y + Z.*Z)));
lon = rad2deg(acos(-Z./sqrt(Y.*Y + Z.*Z)));

Pos_matrix = [height; lat; lon];
end