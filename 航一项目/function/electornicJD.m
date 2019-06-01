function total_elec = electornicJD(size,time,interval,srate,data_length)
if nargin == 4
    data_length = 200*srate;
end
n_interval = interval*srate;
n_time = time*srate;
n_size = n_interval + n_time;
cyc = floor(data_length/(n_interval+n_time));
delta = data_length - cyc*(n_interval+n_time);
total_elec = zeros(1,data_length);
for n = 0:(cyc-1)
    total_elec(n*n_size+n_interval+1:n*n_size+n_interval+n_time) = size;
end
if delta ~= 0
    if delta > n_interval
        total_elec(data_length-delta+1:data_length) = size;
    end    
end    
end