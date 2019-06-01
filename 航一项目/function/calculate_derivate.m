function [vDCosX, vDCosY, vDCosZ] = calculate_derivate(vCosX, vCosY, vCosZ, nSampleFrequency)

%  用于计算方向余弦的微分
%  
%  vCosX，vCosY，vCosZ为方向余弦
%  vDCosX，vDCosY，vDCosZ为其微分
%  nSampleFrequency为采样率，默认为10，若为10可不写
%
%  Created by: Guanyi Zhao
%  $Revision: 1.0.0 $  $Date: 2018/05/14 14:43:07 $
%  
%  Ps：计算结果会用到采样率，默认是10，为别的采样率需要输入该参数

if nargin == 3
    nSampleFrequency = 10;
end

vDCosX = [0;diff(vCosX)] * nSampleFrequency;
vDCosY = [0;diff(vCosY)] * nSampleFrequency;
vDCosZ = [0;diff(vCosZ)] * nSampleFrequency;
end
