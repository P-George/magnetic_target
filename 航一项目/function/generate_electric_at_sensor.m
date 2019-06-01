function [electric] = generate_electric_at_sensor(electric_dipo, Fly_matrix, len,electric_value)

%����len����ż���ӷֱ���̽ͷ����������������ĺ㶨��
%���������permanent_dipo����ż���ؾ���Fly_matrix����ż���ӵ�̽ͷ��λ��������len���������������ǲ�����
%���������ÿ����ż������̽ͷ�������ĺ㶨��������

[Mx, My, Mz] = cal_dipo_sensor(electric_dipo, Fly_matrix);

electric = ones(3,len);
n = 0.1;
electric(1,1:end) = electric(1,1:end).*electric_value'.*Mx.*n;
electric(2,1:end) = electric(2,1:end).*electric_value'.*My.*n;
electric(3,1:end) = electric(3,1:end).*electric_value'.*Mz.*n;
end