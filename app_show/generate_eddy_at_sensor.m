function [Mx, My, Mz] = generate_eddy_at_sensor(index, eddy_loc, eddy_R, eddy_radius, heading, pitch, roll, Xg, Yg, Zg, lat, lon, R)

global pre_H;


Move_matrix = fly_to_move(eddy_loc, heading, pitch, roll);
Init_matrix = move_to_init(Move_matrix, Xg, Yg, Zg, lat, lon);
Pos_matrix = init_to_position(Init_matrix, R);
[~, ~, ~,Geomag_matrix_move] = generate_geomag_wmm(Pos_matrix);
Geomag_matrix_fly = move_to_fly(Geomag_matrix_move, heading, pitch, roll);

if index > 1
    eddy = cal_eddy_axis_sensor(eddy_loc, eddy_radius, eddy_R, Geomag_matrix_fly, pre_H);
    Mx = sum(eddy(1,1:end));
    My = sum(eddy(2,1:end));
    Mz = sum(eddy(3,1:end));
else
    Mx = 0; My = 0; Mz = 0;
end

pre_H = Geomag_matrix_fly;

end
