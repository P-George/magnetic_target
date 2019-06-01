function [longitude, latitude, height, roll, pitch, heading] = get_generate_attitude(data_file)
%函数功能，得到飞机重心处的经度、纬度、高度，以及飞机的欧拉角
% data = csvread(data_file);
% data = data(50000:70000,1:end);
data = zeros(800,9);
for i=1:800
   data(i,1:end) = data_file(1,1:end); 
end
% height = data(1:end,7);
% longitude = data(1:end,5);
% latitude = data(1:end,6);

% heading = data(1:end,10);
% pitch = data(1:end,8);
% roll = data(1:end,9);
height = data(1:end,3);
longitude = data(1:end,1);
latitude = data(1:end,2);
heading_angel = data_file(1,7);
pitch_angel = data_file(1,8);
roll_angel = data_file(1,9);
heading = angel_changed(data_file,4,200,heading_angel);
%heading = data(1:end,4);
%figure();
%plot(heading);
%hold on;
pitch = angel_changed(data_file,5,340,pitch_angel);
%pitch = data(1:end,5);
%plot(pitch);
%hold on;
roll = angel_changed(data_file,6,480,roll_angel);
%roll = data(1:end,6);
%plot(roll);


end