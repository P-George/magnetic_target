function [H, dec, inc, XYZ_m] = generate_geomag_wmm(Pos_matrix)

[~, len] = size(Pos_matrix);
H = zeros(1,len);
dec = zeros(1,len);
inc = zeros(1,len);
XYZ_m = zeros(3,len);
for i = 1:1:len
[XYZ_m(1:3,i), ~, dec(1,i), inc(1,i), H(1,i)] = wrldmagm(Pos_matrix(1,i), Pos_matrix(2,i), Pos_matrix(3,i), decyear(2018,9,25));
end

end