function [vCosX, vCosY, vCosZ] = calculate_cosine(vXorRoll, vYorPitch, vZorYaw, nInclination, nDeclination)

%  ���ڼ��㷽�����ң�����ͨ������������̬���ݼ���
%  
%  ��ʹ�����������㣬��
%  vXorRollΪX��vYorPitchΪY��vZorYawΪZ����Ϊ����
%  nInclination��nDeclination��������
%  ��ʹ����̬���ݼ��㣬��
%  vXorRollΪRoll��vYorPitchΪPitch��vZorYawΪYaw����Ϊ����
%  nInclinationΪ������ǣ�nDeclinationΪ����ƫ�ǣ���Ϊ��ֵ
%  
%  ʾ����
%  [vCosX, vCosY, vCosZ] = calculate_cosine(vX, vY, vZ);
%  or
%  [vCosX, vCosY, vCosZ] = calculate_cosine(vRoll, vPitch, vYaw, 54.1366, -3.9451);
%  
%  Created by: Guanyi Zhao
%  $Revision: 1.0.0 $  $Date: 2018/05/14 14:10:49 $
%  
%  Ps����̬���㷽�������ȶ�����ʱ������Ҫ�޸������ţ��д��Ľ�


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