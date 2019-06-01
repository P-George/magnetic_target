function [vCosX, vCosY, vCosZ] = calculate_cosine(vXorRoll, vYorPitch, vZorYaw, nInclination, nDeclination)

%  用于计算方向余弦，可以通过三分量或姿态数据计算
%  
%  若使用三分量计算，则
%  vXorRoll为X，vYorPitch为Y，vZorYaw为Z，均为向量
%  nInclination和nDeclination不用输入
%  若使用姿态数据计算，则
%  vXorRoll为Roll，vYorPitch为Pitch，vZorYaw为Yaw，均为向量
%  nInclination为当地倾角，nDeclination为当地偏角，均为数值
%  
%  示例：
%  [vCosX, vCosY, vCosZ] = calculate_cosine(vX, vY, vZ);
%  or
%  [vCosX, vCosY, vCosZ] = calculate_cosine(vRoll, vPitch, vYaw, 54.1366, -3.9451);
%  
%  Created by: Guanyi Zhao
%  $Revision: 1.0.0 $  $Date: 2018/05/14 14:10:49 $
%  
%  Ps：姿态计算方法不够稳定，有时可能需要修改正负号，有待改进


if nargin == 3
    vX = vXorRoll;
    vY = vYorPitch;
    vZ = vZorYaw;
    vCosX = vX./sqrt(vX.^2 + vY.^2 + vZ.^2);
    vCosY = vY./sqrt(vX.^2 + vY.^2 + vZ.^2);
    vCosZ = vZ./sqrt(vX.^2 + vY.^2 + vZ.^2);
elseif nargin == 5
    vRoll = vXorRoll;
    vPitch = vYorPitch;
    vYaw = vZorYaw;
    vPsi = vYaw;
    vTheta = vPitch;
    vPhi = vRoll;
    vGeomagneticDirection = [cosd(nInclination)*cosd(nDeclination);...
        cosd(nInclination)*sind(nDeclination);sind(nInclination)];
    vCosX = zeros(size(vRoll));
    vCosY = zeros(size(vRoll));
    vCosZ = zeros(size(vRoll));
    for i = 1:length(vRoll)
        mRotationMatrix = [cosd(vTheta(i))*cosd(vPsi(i)), cosd(vTheta(i))*sind(vPsi(i)), -sind(vTheta(i));...
            sind(vPhi(i))*sind(vTheta(i))*cosd(vPsi(i))-cosd(vPhi(i))*sind(vPsi(i)),...
            sind(vPhi(i))*sind(vTheta(i))*sind(vPsi(i))+cosd(vPhi(i))*cosd(vPsi(i)),...
            sind(vPhi(i))*cosd(vTheta(i));...
            cosd(vPhi(i))*sind(vTheta(i))*cosd(vPsi(i))+sind(vPhi(i))*sind(vPsi(i)),...
            cosd(vPhi(i))*sind(vTheta(i))*sind(vPsi(i))-sind(vPhi(i))*cosd(vPsi(i)),...
            cosd(vPhi(i))*cosd(vTheta(i))];
        vCosGeomagneticDirection = mRotationMatrix * vGeomagneticDirection;
        vCosX(i, 1) = vCosGeomagneticDirection(2);
        vCosY(i, 1) = vCosGeomagneticDirection(1);
        vCosZ(i, 1) = -vCosGeomagneticDirection(3);
    end
end
end