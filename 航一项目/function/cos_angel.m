function [induce, eddy, permanent, Hex, Hey, Hez, X,Y,Z,total,H,latitude,longitude,height,electric_total,displayment_total,roll,pitch,heading,electric_data,displayment_data] = cos_angel(fg_file,sample_rate,ed_data)
R = 6340000;
electric_data = ed_data(:,1);
displayment_data = ed_data(:,2);
[permanent_loc, permanent_dipo, induce_loc, induce_u, eddy_loc, eddy_R, eddy_radius,electric_loc,electric_dipo,displayment_loc,displayment_dipo] = init_set();
[longitude, latitude, height, roll, pitch, heading] = get_generate_attitude(fg_file,sample_rate);

[Gravity_matrix] = position_to_init(height, longitude, latitude, R);

[~, len] = size(Gravity_matrix);

permanent = generate_permanent_at_sensor(permanent_dipo, permanent_loc, len);

electric  = generate_electric_at_sensor(electric_dipo, electric_loc, len,electric_data);

displayment = generate_displayment_at_sensor(displayment_dipo, displayment_loc, len,displayment_data);

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

[X,Y,Z, total] = add_He_interference(He, permanent, induce, eddy,electric,displayment);

X = X';
Y = Y';
Z = Z';

total = total';
H = H';

electric_X = electric(1,1:end);
electric_Y = electric(2,1:end);
electric_Z = electric(3,1:end);
electric_total = sqrt(electric_X.^2 + electric_Y.^2 + electric_Z.^2);
electric_total = electric_total';
displayment_X = displayment(1,1:end);
displayment_Y = displayment(2,1:end);
displayment_Z = displayment(3,1:end);
displayment_total = sqrt(displayment_X.^2 + displayment_Y.^2 + displayment_Z.^2);
displayment_total = displayment_total';
end



