function [Dipo_induce_matrix] = cal_induce_dipo(Geo_matrix, induce_u)

% ��ÿ����ż���ӵļ���
% ���������Geo_matrix���شų��ڲ��㴦����������induce_u���������ɻ��������ϵĴŻ��ʣ�

Dipo_induce_matrix = Geo_matrix.*induce_u;
end