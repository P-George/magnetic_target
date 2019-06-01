% path_read = './hzy_data/2018.7.14∆Ω∑…»¶_Data.xlsx';
% data = xlsread(path_read); % 2000-7500, 7700-10000, 11000-19000
% pitch = data(:, 15);
% roll =  data(:, 16);
% heading =  data(:, 17);
% lat =  data(:, 21);
% lot =  data(:, 22);
% alt =  data(:, 24);
% 
% pitch_1 = data(2000:7500, 15);
% roll_1 =  data(2000:7500, 16);
% heading_1 =  data(2000:7500, 17);
% lat_1 =  data(2000:7500, 21);
% lot_1 =  data(2000:7500, 22);
% alt_1 =  data(2000:7500, 24);
% 
% pitch_2 = data(7700:10000, 15);
% roll_2 =  data(7700:10000, 16);
% heading_2 =  data(7700:10000, 17);
% lat_2 =  data(7700:10000, 21);
% lot_2 =  data(7700:10000, 22);
% alt_2 =  data(7700:10000, 24);
% 
% pitch_3 = data(11000:19000, 15);
% roll_3 =  data(11000:19000, 16);
% heading_3 =  data(11000:19000, 17);
% lat_3 =  data(11000:19000, 21);
% lot_3 =  data(11000:19000, 22);
% alt_3 =  data(11000:19000, 24);
% 
% data_1 = [lot_1, lat_1, alt_1, pitch_1, roll_1, heading_1];
% data_2 = [lot_2, lat_2, alt_2, pitch_2, roll_2, heading_2];
% data_3 = [lot_3, lat_3, alt_3, pitch_3, roll_3, heading_3];
% 
% save('./hzy_data/data_cut1.txt', 'data_1', '-tabs', '-double', '-ascii');
% save('./hzy_data/data_cut2.txt', 'data_2', '-tabs', '-double', '-ascii');
% save('./hzy_data/data_cut3.txt', 'data_3', '-tabs', '-double', '-ascii');

% data = load('./hzy_data/data_cut3.txt');
% len = length(data);
% H = zeros(len, 1);
% h = waitbar(0);
% for i = 1:1:len
%     waitbar(i/len);
% %     [~, ~, ~, ~, H(i,1)] = wrldmagm(alt, lat, lot, decyear(2018,7,14));
%     [~, ~, ~, ~, H(i,1)] = wrldmagm(data(i,3), data(i,2), data(i,1), decyear(2018,9,25));
% end
% close(h);
% save('./hzy_data/H3.txt', 'H', '-tabs', '-double', '-ascii');

% clear;
% data = load('./hzy_data/data_cut1.txt');
% len = length(data);
% wmm_in = [];
% h = waitbar(0);
% for i = 1:1:len
%     waitbar(i/len);
%     word = ['2018.7.14', ' ', 'D', ' ', 'M', num2str(data(i,3)), ' ', num2str(data(i,2)), ' ', num2str(data(i,1))];
%     wmm_in = [wmm_in; word];
% end
% close(h);
% save('./hzy_data/wmm_in_1.txt', 'wmm_in');


data1 = xlsread('./hzy_data/wmm_out_1.xls');
data2 = xlsread('./hzy_data/wmm_out_2.xls');
data3 = xlsread('./hzy_data/wmm_out_3.xls');
wmm_H1 = data1(:,7);
wmm_H2 = data2(:,7);
wmm_H3 = data3(:,7);

