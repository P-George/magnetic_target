function savefile(savepath,name,data)
%SAVEFILE 此处显示有关此函数的摘要
%   此处显示详细说明
%%判断文件夹是否存在，不存在则创建
if ~exist(savepath,'dir') ~= 0
    mkdir(savepath);
    save([savepath,name],'data');
end
end

