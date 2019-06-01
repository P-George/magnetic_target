function newdata = downSample(data,sampleValue)
%DOWNSAMPLE 此处显示有关此函数的摘要
%   此处显示详细说明
%             mNoCurrentData = data(:,1:12);
            mNoCurrentDataFiltered = filter_lowpass(data);% 读取非电流数据 并 滤波
%             mCurrentData = data(:, 13:end);
%             mCurrentDataShifted = [zeros(190, size(mCurrentData, 2)); mCurrentData(1:end-190, :)];% 读取电流数据和UTC时间 并 按照滤波器时延向后平移   ??固定滤波器对所有数据的时延是固定的？
%             mFilteredData = [mNoCurrentDataFiltered, mCurrentDataShifted];% 两者结合
%             mDownsampleData = downsample(mFilteredData, sampleValue);% 降采样,sampleValue为降采样的倍数
mDownsampleData = downsample(mNoCurrentDataFiltered, sampleValue);% 降采样,sampleValue为降采样的倍数
%             [len, col] = size(mDownsampleData);%加入第34/35/36列 全部设为0
%             if col == 33
%                 mDownsampleData = [mDownsampleData,zeros(len,1),zeros(len,1),zeros(len,1)];
%             end
newdata = mDownsampleData;
end

