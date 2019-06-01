function [longitude, latitude, height, roll, pitch, heading] = get_location_attitude(data_file)
%�������ܣ��õ��ɻ����Ĵ��ľ��ȡ�γ�ȡ��߶ȣ��Լ��ɻ���ŷ����
% data = csvread(data_file);
data = load(data_file);
data = data(1:end,1:end);
% data = data(50000:70000,1:end);

% height = data(1:end,7);
% longitude = data(1:end,5);
% latitude = data(1:end,6);

% heading = data(1:end,10);
% pitch = data(1:end,8);
% roll = data(1:end,9);


height = data(1:end,1);
longitude = data(1:end,2);
latitude = data(1:end,3);
heading = angel_changed(data_file,4,50,10);
%heading = data(1:end,4);
%figure();
%plot(heading);
%hold on;
pitch = angel_changed(data_file,5,200,5);
%pitch = data(1:end,5);
%plot(pitch);
%hold on;
roll = angel_changed(data_file,6,400,5);
%roll = data(1:end,6);
%plot(roll);


end