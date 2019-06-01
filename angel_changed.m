function [angell] = angel_changed(data_file,row,insert,angel)
data = zeros(800,9);
for i=1:800
   data(i,1:end) = data_file(1,1:end); 
end
angell = data(1:end,row);
angell = awgn(angell,10);
for n = 0:4:8
    for i=1:10
        angell(insert + n*10+i,1) = angell(insert + n*10+i,1)+angel*sin(pi/20*i);
        angell(insert + (n+1)*10+i,1) = angell(insert + (n+1)*10+i,1)+angel*sin(pi/20*(10-i));
        angell(insert + (n+2)*10+i,1) = angell(insert + (n+2)*10+i,1)-angel*sin(pi/20*i);
        angell(insert + (n+3)*10+i,1) = angell(insert + (n+3)*10+i,1)-angel*sin(pi/20*(10-i));
    end
end
%plot(angell);
end