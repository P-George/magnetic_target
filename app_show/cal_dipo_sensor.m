function [Mx, My, Mz] = cal_dipo_sensor(Dipo_matrix, Fly_matrix)
%Induce_dipo_matrix 3*N
%Fly_matrix 3*N
%Mx, scalar
%My, scalar
%Mz, scalar

uf = -Fly_matrix(1,1:end);
vf = -Fly_matrix(2,1:end);
wf = -Fly_matrix(3,1:end);

p_x = Dipo_matrix(1,1:end);
p_y = Dipo_matrix(2,1:end);
p_z = Dipo_matrix(3,1:end);

%1*N
tmp = 4.*pi.*((uf.^2 + vf.^2 + wf.^2).^2.5);

%1*N
px = p_x./tmp;
py = p_y./tmp;
pz = p_z./tmp;

%1*N
Hxx = px.*(2.*uf.^2 - vf.^2 - wf.^2);
Hyx = px.*3.*uf.*vf;
Hzx = px.*3.*uf.*wf;

%1*N
Hxy = py.*3.*vf.*uf;
Hyy = py.*(2.*vf.^2 - uf.^2 - wf.^2);
Hzy = py.*3.*vf.*wf;

%1*N
Hxz = pz.*3.*wf.*uf;
Hyz = pz.*3.*wf.*vf;
Hzz = pz.*(2.*wf.^2 - vf.^2 - uf.^2);

%1*N
dipo_x = Hxx + Hxy + Hxz;
dipo_y = Hyx + Hyy + Hyz;
dipo_z = Hzx + Hzy + Hzz;


Mx = sum(dipo_x);
My = sum(dipo_y);
Mz = sum(dipo_z);
 
end