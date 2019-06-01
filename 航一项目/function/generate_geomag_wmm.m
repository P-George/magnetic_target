function [H, dec, inc, XYZ_m] = generate_geomag_wmm(Pos_matrix)

%用wmm算
%输入变量：[高；纬；经]矩阵

[~, len] = size(Pos_matrix);
H = zeros(1,len);
dec = zeros(1,len);
inc = zeros(1,len);
XYZ_m = zeros(3,len);
for i = 1:1:len
[XYZ_m(1:3,i), ~, dec(1,i), inc(1,i), H(1,i)] = wrldmagm(Pos_matrix(1,i), Pos_matrix(2,i), Pos_matrix(3,i), decyear(2015,7,4),'2015');
end

end