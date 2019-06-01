function [He_x, He_y, He_z, He] = generate_geomag_at_sensor(heading, pitch, roll, lat, lon, height)

%计算每一个经纬高确定的地磁场在探头处三分量和总场
%输入变量：heading, pitch, roll, lat, lon, height，每一采样点处飞机的经纬高、姿态
%输出变量：He_x, He_y, He_z, He，每一个经纬高确定的地磁场在探头处三分量和总场

[He, ~, ~, Geomag_matrix_move] = generate_geomag_wmm([height; lat; lon]); 
Geomag_matrix_fly = move_to_fly(Geomag_matrix_move, heading, pitch, roll);
He_x = Geomag_matrix_fly(1,1:end);
He_y = Geomag_matrix_fly(2,1:end);
He_z = Geomag_matrix_fly(3,1:end);
end