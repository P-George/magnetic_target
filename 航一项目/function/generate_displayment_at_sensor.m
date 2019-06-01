function [displayment] = generate_displayment_at_sensor(displayment_dipo, Fly_matrix, len,displayment_value)
%����len����ż���ӷֱ���̽ͷ����������������ĺ㶨��
%���������permanent_dipo����ż���ؾ���Fly_matrix����ż���ӵ�̽ͷ��λ��������len���������������ǲ�����
%���������ÿ����ż������̽ͷ�������ĺ㶨��������
[Mx, My, Mz] = cal_dipo_sensor(displayment_dipo, Fly_matrix);
displayment = ones(3,len);
n = 0.5; %ϵ��
displayment(1,1:end) = displayment(1,1:end).*displayment_value'.*Mx.*n;
displayment(2,1:end) = displayment(2,1:end).*displayment_value'.*My.*n;
displayment(3,1:end) = displayment(3,1:end).*displayment_value'.*Mz.*n;
end