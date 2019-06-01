file_list = ls('./fg_data');
[len, col] = size(file_list);

for i = 3:len
    file_name = file_list(i,1:end);
    file_tmp = ['./fg_data/',file_name];
    [induce, eddy, permanent, Hex, Hey, Hez, X, Y, Z, total, H, latitude, longitude, height] = start_simulate(file_tmp);
    file_tmp = ['./out/',file_name(1:end-3),'mat'];
    save(file_tmp,'total','X','Y','Z', 'H', 'latitude', 'longitude', 'height');
    file_tmp
end