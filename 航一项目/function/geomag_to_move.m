function [Geomag_matrix] = geomag_to_move(H, dec, inc)
%H: scalar or row
%dec: deg, scalar or row
%inc: deg, scalar or row
%Geomag_matrix: 3*N
dec_rad = deg2rad(dec);
inc_rad = deg2rad(inc);

Hx_m = H.*cos(inc_rad).*cos(dec_rad);
Hy_m = H.*cos(inc_rad).*sin(dec_rad);
Hz_m = H.*sin(inc_rad);

Geomag_matrix = [Hx_m; Hy_m; Hz_m];
end