function geomag_field = create_geomag(LLH)
%CREATE GEOMAG 此处显示有关此函数的摘要
% LLH为保存的经纬高数据文件
%   此处显示详细说明
geomag_field = [];
for i = 1:size(LLH,1)
[XYZ, H, DEC, DIP, F] = wrldmagm(LLH(i,3), LLH(i,2), LLH(i,1), decyear(2015,7,4),'2015');
geomag_field = [geomag_field;F];
end
end

