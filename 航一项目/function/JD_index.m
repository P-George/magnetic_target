function [FOM,IR] = JD_index(total,compensatedtotal,fs)

mppv_FilteredTotal = [];
mppv_FilteredCompensatedTotal = [];
mIR = [];
mSingleIR = [];

%加载数据文件和点号文件 %%%导入数据后结构体中变量名称后期看要不要改%%%
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
    win = mPointRecord(j,1):mPointRecord(j,2);%这里看后期要不要改
    seg_FilteredTotal = mData(win);%补偿前滤波后总场 %%%数据文件19列%%%
    seg_FilteredCompensatedTotal = compensatedtotal(win);%补偿后滤波后总场 %%%第20列%%%
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
%补偿前每一圈12个动作峰峰值的均值
mppv_FilteredTotal = [mppv_FilteredTotal,ppv_FilteredTotal];
%补偿后每一圈12个动作峰峰值的均值
mppv_FilteredCompensatedTotal = [mppv_FilteredCompensatedTotal,ppv_FilteredCompensatedTotal];
%一圈的改善比
mIR = [mIR,IR];
%单个动作的改善比
mSingleIR = [mSingleIR,SingleIR];


impRatioValue = mIR(1);
FOMValue = mppv_FilteredCompensatedTotal(1);
IR = impRatioValue;
FOM = FOMValue;
end