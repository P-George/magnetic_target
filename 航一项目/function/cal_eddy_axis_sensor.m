function [eddy_] = cal_eddy_axis_sensor(eddy_loc, r, R, H, H_pre)
%�������ܣ����㵥����Ȧ�ڴ�����λ�ô��������������Ĵ�С
%���������d����Ȧ���ĵ�������λ�õľ��룬r����Ȧ�뾶��R����Ȧ�ĵ��裬H����ǰ�ĵشų���С��H_pre����һʱ�̵ĵشų���С
%���ò�����
f = 10;
%������Դŵ���
u = 1;
%������մŵ���
u0 = 4.*pi.*1e-7;

s = r.^2;

pp = pi.*s.*u.*u0;

phi = pp.*H;

phi_pre =  pp.*H_pre;

E = -(phi-phi_pre).*f;

I = E./R;

eddy_ = 0.5.*(u0.*s.*I)./((s+eddy_loc.^2).^1.5);  %�͹�ʽ�Բ���

[m,n]=find(isnan(eddy_)==1);

for i = 1:1:length(m)
    eddy_(m(i),n(i)) = 0;
end

end