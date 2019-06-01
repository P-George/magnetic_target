function [Mx, My, Mz] = generate_induce_at_sensor(induce_loc, induce_u, heading, pitch, roll, Xg, Yg, Zg, lat, lon, R)
%induce_loc 3*N
%induce_u 3*N
%heading scalar
%pitch scalar
%roll scalar
%Xg scalar
%Yg scalar
%Zg scalar
%lat scalar
%lon scalar
%R scalar
%Mx scalar
%My scalar
%Mz scalar

Move_matrix = fly_to_move(induce_loc, heading, pitch, roll);
Init_matrix = move_to_init(Move_matrix, Xg, Yg, Zg, lat, lon);
Pos_matrix = init_to_position(Init_matrix, R);
[~, ~, ~, Geomag_matrix_move] = generate_geomag_wmm(Pos_matrix);
Geomag_matrix_fly = move_to_fly(Geomag_matrix_move, heading, pitch, roll);
Induce_dipo_matrix = cal_induce_dipo(Geomag_matrix_fly, induce_u);
[Mx, My, Mz] = cal_dipo_sensor(Induce_dipo_matrix, induce_loc);

end