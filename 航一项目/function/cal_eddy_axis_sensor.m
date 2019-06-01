function [eddy_] = cal_eddy_axis_sensor(eddy_loc, r, R, H, H_pre)
%函数功能，计算单个线圈在磁力仪位置处产生的涡流场的大小
%输入变量，d，线圈中心到磁力仪位置的距离，r，线圈半径，R，线圈的电阻，H，当前的地磁场大小，H_pre，上一时刻的地磁场大小
%设置采样率
f = 10;
%设置相对磁导率
u = 1;
%设置真空磁导率
u0 = 4.*pi.*1e-7;

s = r.^2;

pp = pi.*s.*u.*u0;

phi = pp.*H;

phi_pre =  pp.*H_pre;

E = -(phi-phi_pre).*f;

I = E./R;

eddy_ = 0.5.*(u0.*s.*I)./((s+eddy_loc.^2).^1.5);  %和公式对不上

[m,n]=find(isnan(eddy_)==1);

for i = 1:1:length(m)
    eddy_(m(i),n(i)) = 0;
end

end