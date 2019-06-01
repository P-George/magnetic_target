% file_list = ls('./fg_data');
% [len, col] = size(file_list);
% 
% for i = 3:len
%     file_name = file_list(i,1:end);
%     file_tmp = ['./fg_data/',file_name];
%     [induce, eddy, permanent, Hex, Hey, Hez, X, Y, Z, total, H, latitude, longitude, height] = start_simulate(file_tmp);
%     file_tmp = ['./out/',file_name(1:end-3),'mat'];
%     save(file_tmp,'total','X','Y','Z', 'H', 'latitude', 'longitude', 'height');
%     file_tmp
% end

clear;
file_list = './fg_data/20170815_100down10.txt';
data = load(file_list);
% data = data(50000:70000,:);
total_orig = data(:,1);
x_orig = data(:,2);
y_orig = data(:,3);
z_orig = data(:,4);
[induce, eddy, permanent, Hex, Hey, Hez, X, Y, Z, total, H, latitude, longitude, height] = start_simulate(file_list);
ax(1)=subplot(2,2,1);plot(total_orig,'DisplayName','total_orig');hold on;plot(total,'DisplayName','total');hold off;legend('total-orig','total');
ax(2)=subplot(2,2,2);plot(x_orig,'DisplayName','x_orig');hold on;plot(Y,'DisplayName','Y');hold off;legend('x-orig','Y');
ax(3)=subplot(2,2,3);plot(y_orig,'DisplayName','y_orig');hold on;plot(X,'DisplayName','X');hold off;legend('y-orig','X');
ax(4)=subplot(2,2,4);plot(z_orig,'DisplayName','z_orig');hold on;plot(Z,'DisplayName','Z');hold off;legend('z-orig','Z');
linkaxes(ax,'x');
