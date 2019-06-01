function [He_x, He_y, He_z, He] = generate_geomag_at_sensor(heading, pitch, roll, lat, lon, height)
[He, ~, ~, Geomag_matrix_move] = generate_geomag_wmm([height; lat; lon]);
Geomag_matrix_fly = move_to_fly(Geomag_matrix_move, heading, pitch, roll);
He_x = Geomag_matrix_fly(1,1:end);
He_y = Geomag_matrix_fly(2,1:end);
He_z = Geomag_matrix_fly(3,1:end);
end
