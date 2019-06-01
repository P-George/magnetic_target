function [induce, eddy, permanent, Hex, Hey, Hez, X,Y,Z,total_final,H,latitude,longitude,height] = cos_angel(fg_file,sample_rate)
R = 6340000;
[permanent_loc, permanent_dipo, induce_loc, induce_u, eddy_loc, eddy_R, eddy_radius] = init_set();
[longitude, latitude, height, roll, pitch, heading] = get_generate_attitude(fg_file);

[Gravity_matrix] = position_to_init(height, longitude, latitude, R);

[~, len] = size(Gravity_matrix);

permanent = generate_permanent_at_sensor(permanent_dipo, permanent_loc, len);

induce = zeros(3,len);
eddy = zeros(3,len);
He = zeros(3,len);
H = zeros(1,len);


for i = 1:1:len
    [He(1,i), He(2,i), He(3,i), H(i)] = generate_geomag_at_sensor(heading(i), pitch(i), roll(i), latitude(i), longitude(i), height(i));
    [induce(1,i), induce(2,i), induce(3,i)] = generate_induce_at_sensor(induce_loc, induce_u, heading(i), pitch(i), roll(i), Gravity_matrix(1,i), Gravity_matrix(2,i), Gravity_matrix(3,i), latitude(i), longitude(i), R);
    [eddy(1,i), eddy(2,i), eddy(3,i)] = generate_eddy_at_sensor(i, eddy_loc, eddy_R, eddy_radius, heading(i), pitch(i), roll(i), Gravity_matrix(1,i), Gravity_matrix(2,i), Gravity_matrix(3,i), latitude(i), longitude(i), R);
end

Hex = He(1,1:end)';
Hey = He(2,1:end)';
Hez = He(3,1:end)';

[X,Y,Z, total] = add_interference( permanent, induce, eddy);

X = X';
Y = Y';
Z = Z';

total = total';
n_total = 200*sample_rate;
step_size = 800/n_total;
sample_old = 1:800;
sample_new = 1:step_size:800;
total_final = interp1(sample_old,total,sample_new);
total_final = total_final';
H = H';
%plot(total_final);
end



