function mFilteredData = filter_lowpass(mUnfilteredData)

%  对100Hz数据低通滤波，截至频率1.2Hz高斯窗滤波器
%  
%  mUnfilteredData：待滤波数据，可以是列向量，也可以是按列组合的矩阵
%  mFilteredData：滤波后数据，格式、长度均与输入相同
%  
%  示例：
%  mData =
%       load_original_data('./data/original/20180423174536.579-所有数据100Hz.txt');
%  mFilteredData = filter_lowpass(mData(:, 1:4));
% 
%  Created by: Guanyi Zhao
%  $Revision: 1.0.0 $  $Date: 2018/05/11 13:35:49 $
%  
%  修改：从文件中读取滤波器系数
%  Updated by: Guanyi Zhao
%  $Revision: 1.0.1 $  $Date: 2018/06/14 13:49:23 $

b = load('./filter/lowpass_fir_100_1.txt');% old
Hd = dfilt.dffir(b);

mDoubleData = [flipud(mUnfilteredData);mUnfilteredData];
mDoubleData = filter(Hd, mDoubleData);
mFilteredData = mDoubleData(size(mUnfilteredData, 1) + 1 : end, :);

end
