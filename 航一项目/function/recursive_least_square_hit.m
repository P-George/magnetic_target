function [vCoefficient] = recursive_least_square_hit(vY, mX)

%  递推最小二乘算法，用户计算Xb = Y中的b
%  
%  vY：Xb = Y中的Y
%  mX：Xb = Y中的X
%  
%  示例：
%  Created by: Guanyi Zhao
%  $Revision: 1.0.0 $  $Date: 2018/05/14 14:11:06 $

nRho = 1;
nOrder = size(mX, 2);
mPCur = 100000*eye(nOrder,nOrder);
vCfsCur = mX\vY;
Record = vCfsCur';
Rec_P = [];
Rec_K = [];
for i=1:size(mX,1)-1
    vKCur = (mPCur*mX(i,:)')/(nRho+mX(i,:)*mPCur*mX(i,:)');   %Rec_K = [Rec_K,vKCur];
    mPCur = (1/nRho)*(mPCur-vKCur*mX(i,:)*mPCur);   %Rec_P = [Rec_P,mPCur];
    vCfsCur = vCfsCur + vKCur*(vY(i)-mX(i,:)*vCfsCur);
    Record = [Record;vCfsCur'];
    %Error(i,1) = vY(i) - mX(i,:)*vCfsCur ;%ly
end
vCoefficient = vCfsCur;
end