function [electric] = generate_electric_at_sensor(electric_dipo, Fly_matrix, len,electric_value)

%计算len个磁偶极子分别在探头处延三个方向产生的恒定场
%输入变量：permanent_dipo，磁偶极矩矩阵；Fly_matrix，磁偶极子到探头的位置向量；len，采样点数，不是布点数
%输出变量：每个磁偶极子在探头处产生的恒定场三分量

[Mx, My, Mz] = cal_dipo_sensor(electric_dipo, Fly_matrix);

electric = ones(3,len);
n = 0.1;
electric(1,1:end) = electric(1,1:end).*electric_value'.*Mx.*n;
electric(2,1:end) = electric(2,1:end).*electric_value'.*My.*n;
electric(3,1:end) = electric(3,1:end).*electric_value'.*Mz.*n;
end