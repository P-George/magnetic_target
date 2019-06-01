function [longitude, latitude, height, roll, pitch, heading] = get_location_attitude(data_file)
%�������ܣ��õ��ɻ����Ĵ��ľ��ȡ�γ�ȡ��߶ȣ��Լ��ɻ���ŷ����
data = csvread(data_file);
data = data(1:end,1:end);

height = data(1:end,1);
longitude = data(1:end,2);
latitude = data(1:end,3);

heading = data(1:end,4);
pitch = data(1:end,5);
roll = data(1:end,6);


end