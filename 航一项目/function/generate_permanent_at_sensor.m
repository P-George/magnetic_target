function [permanent] = generate_permanent_at_sensor(permanent_dipo, Fly_matrix, len)

%计算len个磁偶极子分别在探头处延三个方向产生的恒定场
%输入变量：permanent_dipo，磁偶极矩矩阵；Fly_matrix，磁偶极子到探头的位置向量；len，采样点数，不是布点数
%输出变量：每个磁偶极子在探头处产生的恒定场三分量

[Mx, My, Mz] = cal_dipo_sensor(permanent_dipo, Fly_matrix);
permanent = ones(3,len);
permanent(1,1:end) = permanent(1,1:end).*Mx;
permanent(2,1:end) = permanent(2,1:end).*My;
permanent(3,1:end) = permanent(3,1:end).*Mz;
end