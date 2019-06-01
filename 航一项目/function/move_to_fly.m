function [Fly_matrix] = move_to_fly(Move_matrix, heading, pitch, roll)
%heading: deg, scalar
%pitch: deg, scalar
%roll: deg, scalar
%FLy_matrix: 3*N matrix
%Move_matrix: 3*N matrix
heading_rad = deg2rad(heading);
pitch_rad = deg2rad(pitch);
roll_rad = deg2rad(roll);

HM = [cos(heading_rad), sin(heading_rad), 0; -sin(heading_rad), cos(heading_rad), 0; 0, 0, 1];
PM = [cos(pitch_rad), 0, -sin(pitch_rad); 0, 1, 0; sin(pitch_rad), 0, cos(pitch_rad)];
RM = [1, 0, 0; 0, cos(roll_rad), sin(roll_rad); 0, -sin(roll_rad), cos(roll_rad)];
Fly_matrix = RM*PM*HM*Move_matrix;
end