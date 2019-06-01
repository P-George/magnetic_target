function draw = plot4direction(data_file1,data_file2,data_file3,data_file4)
position = [221,222,223,224];
draw = 1;

[~, ~, ~, ~, ~, ~, ~,~,~,total_1,~,~,~,~] = cos_angel(data_file1);
[~, ~, ~, ~, ~, ~, ~,~,~,total_2,~,~,~,~] = cos_angel(data_file2);
[~, ~, ~, ~, ~, ~, ~,~,~,total_3,~,~,~,~] = cos_angel(data_file3);
[~, ~, ~, ~, ~, ~, ~,~,~,total_4,~,~,~,~] = cos_angel(data_file4);

subplot(position(1)),plot(total_1),title('degree 0'),xlabel('采样点 '),ylabel('磁干扰 (nT)');
subplot(position(2)),plot(total_2),title('degree 90'),xlabel('采样点 '),ylabel('磁干扰 (nT)');
subplot(position(3)),plot(total_3),title('degree 180'),xlabel('采样点 '),ylabel('磁干扰 (nT)');
subplot(position(4)),plot(total_4),title('degree 270'),xlabel('采样点 '),ylabel('磁干扰 (nT)');
%save total_1;
end