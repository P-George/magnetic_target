function [vDCosX, vDCosY, vDCosZ] = calculate_derivate(vCosX, vCosY, vCosZ, nSampleFrequency)

%  ���ڼ��㷽�����ҵ�΢��
%  
%  vCosX��vCosY��vCosZΪ��������
%  vDCosX��vDCosY��vDCosZΪ��΢��
%  nSampleFrequencyΪ�����ʣ�Ĭ��Ϊ10����Ϊ10�ɲ�д
%
%  Created by: Guanyi Zhao
%  $Revision: 1.0.0 $  $Date: 2018/05/14 14:43:07 $
%  
%  Ps�����������õ������ʣ�Ĭ����10��Ϊ��Ĳ�������Ҫ����ò���

if nargin == 3
    nSampleFrequency = 10;
end

vDCosX = [0;diff(vCosX)] * nSampleFrequency;
vDCosY = [0;diff(vCosY)] * nSampleFrequency;
vDCosZ = [0;diff(vCosZ)] * nSampleFrequency;
end
