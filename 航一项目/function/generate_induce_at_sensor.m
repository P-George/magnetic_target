function [Mx, My, Mz] = generate_induce_at_sensor(induce_loc, induce_u, heading, pitch, roll, Xg, Yg, Zg, lat, lon, R)

%����N�������������ֱ���̽ͷ����������������ĸ�Ӧ��
%���������induce_loc,N�����������������ꣻinduce_u,�������ɻ��������ϵĴŻ��ʣ�
%          heading, pitch, roll,
%          Xg, Yg, Zg 
%          lat, lon, R γ����������뾶

%induce_loc 3*N
%induce_u 3*N
%heading scalar
%pitch scalar
%roll scalar
%Xg scalar
%Yg scalar
%Zg scalar
%lat scalar
%lon scalar
%R scalar
%Mx scalar
%My scalar
%Mz scalar

% ÿ������ӻ�������任��ƽ������
Move_matrix = fly_to_move(induce_loc, heading, pitch, roll);
% ÿ�������ƽ������任����ʼ����
Init_matrix = move_to_init(Move_matrix, Xg, Yg, Zg, lat, lon);
% ÿ������ӳ�ʼ����任����γ��
Pos_matrix = init_to_position(Init_matrix, R);
% ÿ�����㴦�شų�����������ƽ������ϵ��
[~, ~, ~, Geomag_matrix_move] = generate_geomag_wmm(Pos_matrix);
% ÿ�����㴦�شų�������������������ϵ��
Geomag_matrix_fly = move_to_fly(Geomag_matrix_move, heading, pitch, roll);
% ÿ����ż���ӵļ���
Induce_dipo_matrix = cal_induce_dipo(Geomag_matrix_fly, induce_u);
%�����������ϵ��k�������ż�����ڴ�����λ�ô������Ĵų��ڻ�������ϵ�������ϵĴ�С
[Mx, My, Mz] = cal_dipo_sensor(Induce_dipo_matrix, induce_loc);

end