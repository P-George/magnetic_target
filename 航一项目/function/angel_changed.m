function [angell] = angel_changed(data_file,row,insert,angel,sample_rate)
n_total = sample_rate*200;
n_samp = 10*sample_rate;
data = zeros(n_total,9);
for i=1:n_total
   data(i,1:end) = data_file(1,1:end); 
end
angell = data(1:end,row);
angell = awgn(angell,10);
for n = 0:2
    for i=1:n_samp
        angell(insert + n*n_samp+i,1) = angell(insert + n*n_samp+i,1)+angel*sin(2*pi/n_samp*i);
    end
end
%plot(angell);
end