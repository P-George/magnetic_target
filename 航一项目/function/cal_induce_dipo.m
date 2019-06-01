function [Dipo_induce_matrix] = cal_induce_dipo(Geo_matrix, induce_u)

% 算每个磁偶极子的极矩
% 输入参数：Geo_matrix，地磁场在布点处的三分量；induce_u，延三个飞机坐标轴上的磁化率；

Dipo_induce_matrix = Geo_matrix.*induce_u;
end