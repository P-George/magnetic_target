function newdata = downSample(data,sampleValue)
%DOWNSAMPLE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%             mNoCurrentData = data(:,1:12);
            mNoCurrentDataFiltered = filter_lowpass(data);% ��ȡ�ǵ������� �� �˲�
%             mCurrentData = data(:, 13:end);
%             mCurrentDataShifted = [zeros(190, size(mCurrentData, 2)); mCurrentData(1:end-190, :)];% ��ȡ�������ݺ�UTCʱ�� �� �����˲���ʱ�����ƽ��   ??�̶��˲������������ݵ�ʱ���ǹ̶��ģ�
%             mFilteredData = [mNoCurrentDataFiltered, mCurrentDataShifted];% ���߽��
%             mDownsampleData = downsample(mFilteredData, sampleValue);% ������,sampleValueΪ�������ı���
mDownsampleData = downsample(mNoCurrentDataFiltered, sampleValue);% ������,sampleValueΪ�������ı���
%             [len, col] = size(mDownsampleData);%�����34/35/36�� ȫ����Ϊ0
%             if col == 33
%                 mDownsampleData = [mDownsampleData,zeros(len,1),zeros(len,1),zeros(len,1)];
%             end
newdata = mDownsampleData;
end

