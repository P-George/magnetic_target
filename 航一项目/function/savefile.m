function savefile(savepath,name,data)
%SAVEFILE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%%�ж��ļ����Ƿ���ڣ��������򴴽�
if ~exist(savepath,'dir') ~= 0
    mkdir(savepath);
    save([savepath,name],'data');
end
end

