function [RotM]=Euler2RotM(EulerLat,EulerLon,EulerAng)

EulerLat=EulerLat*pi/180;
EulerLon=EulerLon*pi/180;
EulerAng=EulerAng*pi/180;

[x,y,z]=sph2cart(EulerLon,EulerLat,1);

RotM=axang2rotm([x,y,z,EulerAng]);

end