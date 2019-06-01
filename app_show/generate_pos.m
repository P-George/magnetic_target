function [dataName] = generate_pos()
ini_axis = zeros(1,6);
ini_axis(1,1) = 50;
ini_axis(1,2) = 50+30;

ini_axis(1,3) = 85;
ini_axis(1,4) = 85+30;

ini_axis(1,5) = 120;
ini_axis(1,6) = 120+30;
pos_axis = zeros(12,2);
for n = 0:3
    for i=1:6
        pos_axis(n*3+1,1) = 200*n + ini_axis(1,1);
        pos_axis(n*3+1,2) = 200*n + ini_axis(1,2);
        pos_axis(n*3+2,1) = 200*n + ini_axis(1,3);
        pos_axis(n*3+2,2) = 200*n + ini_axis(1,4);
        pos_axis(n*3+3,1) = 200*n + ini_axis(1,5);
        pos_axis(n*3+3,2) = 200*n + ini_axis(1,6);
    end
end
dataName = 'insert_pos.mat';
save('insert_pos.mat','pos_axis');
end