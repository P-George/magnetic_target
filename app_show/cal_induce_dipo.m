function [Dipo_induce_matrix] = cal_induce_dipo(Geo_matrix, induce_u)
Dipo_induce_matrix = Geo_matrix.*induce_u;
end