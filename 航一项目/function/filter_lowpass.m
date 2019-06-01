function mFilteredData = filter_lowpass(mUnfilteredData)

%  ��100Hz���ݵ�ͨ�˲�������Ƶ��1.2Hz��˹���˲���
%  
%  mUnfilteredData�����˲����ݣ���������������Ҳ�����ǰ�����ϵľ���
%  mFilteredData���˲������ݣ���ʽ�����Ⱦ���������ͬ
%  
%  ʾ����
%  mData =
%       load_original_data('./data/original/20180423174536.579-��������100Hz.txt');
%  mFilteredData = filter_lowpass(mData(:, 1:4));
% 
%  Created by: Guanyi Zhao
%  $Revision: 1.0.0 $  $Date: 2018/05/11 13:35:49 $
%  
%  �޸ģ����ļ��ж�ȡ�˲���ϵ��
%  Updated by: Guanyi Zhao
%  $Revision: 1.0.1 $  $Date: 2018/06/14 13:49:23 $

b = load('./filter/lowpass_fir_100_1.txt');% old
Hd = dfilt.dffir(b);

mDoubleData = [flipud(mUnfilteredData);mUnfilteredData];
mDoubleData = filter(Hd, mDoubleData);
mFilteredData = mDoubleData(size(mUnfilteredData, 1) + 1 : end, :);

end
