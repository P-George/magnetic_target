function total_disp = displapment(size,time,interval,srate,data_length)
if nargin == 4
    data_length = 500;
end
n_interval = interval*srate;
n_time = time*srate;
n_size = n_interval + n_time;
cyc = floor(data_length/(n_size));
delta = data_length - cyc*(n_interval+n_time);
total_disp = zeros(1,data_length);
peak = zeros(1,n_time);
peak(1:floor(n_time/2)) = size/floor(n_time/2):size/floor(n_time/2):size;
peak(ceil(n_time/2):n_time) = size:-size/(n_time-floor(n_time/2)):0;
for n = 0: (cyc-1)    
    total_disp(n*n_size+n_interval+1:n*n_size+n_interval+n_time)=peak;
end
if delta ~= 0
    if delta > n_interval
        total_disp(data_length-delta+n_interval+1:data_length) = peak(1:delta-n_interval);
    end    
end 
plot(total_disp);
end