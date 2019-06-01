function [permanent] = generate_permanent_at_sensor(permanent_dipo, Fly_matrix, len)
[Mx, My, Mz] = cal_dipo_sensor(permanent_dipo, Fly_matrix);
permanent = ones(3,len);
permanent(1,1:end) = permanent(1,1:end).*Mx;
permanent(2,1:end) = permanent(2,1:end).*My;
permanent(3,1:end) = permanent(3,1:end).*Mz;
end
