function [FOM,IR] = JD_index(total,compensatedtotal,fs)

mppv_FilteredTotal = [];
mppv_FilteredCompensatedTotal = [];
mIR = [];
mSingleIR = [];

%���������ļ��͵���ļ� %%%�������ݺ�ṹ���б������ƺ��ڿ�Ҫ��Ҫ��%%%
mData = total;


load('insert_pos.mat');
mPointRecord = pos_axis*fs;
ppv_FilteredTotal = [];
ppv_FilteredCompensatedTotal = [];
Fom_FilteredTotal = [];
Fom_FilteredCompensatedTotal = [];
IR = [];
SingleIR = [];

for j = 1:length(mPointRecord)
    win = mPointRecord(j,1):mPointRecord(j,2);%���￴����Ҫ��Ҫ��
    seg_FilteredTotal = mData(win);%����ǰ�˲����ܳ� %%%�����ļ�19��%%%
    seg_FilteredCompensatedTotal = compensatedtotal(win);%�������˲����ܳ� %%%��20��%%%
    ppv_tmp_FilteredTotal = max(seg_FilteredTotal) - min(seg_FilteredTotal);
    ppv_tmp_FilteredCompensatedTotal = max(seg_FilteredCompensatedTotal) - min(seg_FilteredCompensatedTotal);
    ppv_FilteredTotal = [ppv_FilteredTotal;ppv_tmp_FilteredTotal];
    ppv_FilteredCompensatedTotal = [ppv_FilteredCompensatedTotal;ppv_tmp_FilteredCompensatedTotal];
    if mod(j,12) == 0
        A_ppv_FilteredTotal = mean(ppv_FilteredTotal(j-11:j));
        A_ppv_FilteredCompensatedTotal = mean(ppv_FilteredCompensatedTotal(j-11:j));
        Fom_FilteredTotal = [Fom_FilteredTotal;A_ppv_FilteredTotal];
        Fom_FilteredCompensatedTotal = [Fom_FilteredCompensatedTotal;A_ppv_FilteredCompensatedTotal];
        SingleIR = [SingleIR;ppv_FilteredTotal(j-11:j)./ppv_FilteredCompensatedTotal(j-11:j)];
        IR = [IR;A_ppv_FilteredTotal/A_ppv_FilteredCompensatedTotal];
    end
end
%����ǰÿһȦ12���������ֵ�ľ�ֵ
mppv_FilteredTotal = [mppv_FilteredTotal,ppv_FilteredTotal];
%������ÿһȦ12���������ֵ�ľ�ֵ
mppv_FilteredCompensatedTotal = [mppv_FilteredCompensatedTotal,ppv_FilteredCompensatedTotal];
%һȦ�ĸ��Ʊ�
mIR = [mIR,IR];
%���������ĸ��Ʊ�
mSingleIR = [mSingleIR,SingleIR];


impRatioValue = mIR(1);
FOMValue = mppv_FilteredCompensatedTotal(1);
IR = impRatioValue;
FOM = FOMValue;
end