function [Mx, My, Mz] = generate_induce_at_sensor(induce_loc, induce_u, heading, pitch, roll, Xg, Yg, Zg, lat, lon, R)

%计算N个布点软铁棒分别在探头处延三个方向产生的感应场
%输入参数：induce_loc,N个布点软铁棒的坐标；induce_u,延三个飞机坐标轴上的磁化率；
%          heading, pitch, roll,
%          Xg, Yg, Zg 
%          lat, lon, R 纬、经、地球半径

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

% 每个布点从机体坐标变换到平移坐标
Move_matrix = fly_to_move(induce_loc, heading, pitch, roll);
% 每个布点从平移坐标变换到初始坐标
Init_matrix = move_to_init(Move_matrix, Xg, Yg, Zg, lat, lon);
% 每个布点从初始坐标变换到经纬高
Pos_matrix = init_to_position(Init_matrix, R);
% 每个布点处地磁场的三分量（平移坐标系）
[~, ~, ~, Geomag_matrix_move] = generate_geomag_wmm(Pos_matrix);
% 每个布点处地磁场的三分量（机体坐标系）
Geomag_matrix_fly = move_to_fly(Geomag_matrix_move, heading, pitch, roll);
% 每个磁偶极子的极矩
Induce_dipo_matrix = cal_induce_dipo(Geomag_matrix_fly, induce_u);
%计算机体坐标系上k个布点磁偶极子在磁力仪位置处产生的磁场在机体坐标系三分量上的大小
[Mx, My, Mz] = cal_dipo_sensor(Induce_dipo_matrix, induce_loc);

end