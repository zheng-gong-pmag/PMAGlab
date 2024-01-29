function [Rot_Plat,Rot_Plon]=EulerRot(Plat,Plon,EulerLat,EulerLon,EulerAng)

% Convert Lat/Lon to Cartesian
x=cosd(Plat).*cosd(Plon);
y=cosd(Plat).*sind(Plon);
z=sind(Plat);

Euler_x=cosd(EulerLat).*cosd(EulerLon);
Euler_y=cosd(EulerLat).*sind(EulerLon);
Euler_z=sind(EulerLat);

% Compute rotation matrix elements
Rot11=Euler_x.*Euler_x.*(1-cosd(EulerAng))+cosd(EulerAng);
Rot12=Euler_x.*Euler_y.*(1-cosd(EulerAng))-Euler_z.*sind(EulerAng);
Rot13=Euler_x.*Euler_z.*(1-cosd(EulerAng))+Euler_y.*sind(EulerAng);

Rot21=Euler_y.*Euler_x.*(1-cosd(EulerAng))+Euler_z.*sind(EulerAng);
Rot22=Euler_y.*Euler_y.*(1-cosd(EulerAng))+cosd(EulerAng);
Rot23=Euler_y.*Euler_z.*(1-cosd(EulerAng))-Euler_x.*sind(EulerAng);

Rot31=Euler_z.*Euler_x.*(1-cosd(EulerAng))-Euler_y.*sind(EulerAng);
Rot32=Euler_z.*Euler_y.*(1-cosd(EulerAng))+Euler_x.*sind(EulerAng);
Rot33=Euler_z.*Euler_z.*(1-cosd(EulerAng))+cosd(EulerAng);

% Apply rotation
Rot_x=Rot11.*x+Rot12.*y+Rot13.*z;
Rot_y=Rot21.*x+Rot22.*y+Rot23.*z;
Rot_z=Rot31.*x+Rot32.*y+Rot33.*z;

% Convert Cartesian to Lat/Lon
Rot_Plat=asind(Rot_z);
Rot_Plon=mod(atan2d(Rot_y,Rot_x),360);

end