function [EulerLat,EulerLon,EulerAng]=RotM2Euler(RotM)

axang=rotm2axang(RotM);

[EulerLon,EulerLat,~]=cart2sph(axang(1),axang(2),axang(3));

EulerLat=EulerLat*180/pi;
EulerLon=EulerLon*180/pi;
EulerAng=axang(4)*180/pi;

end