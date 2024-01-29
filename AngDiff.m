function [theta]=AngDiff(Dec1,Inc1,Dec2,Inc2)

xx=cosd(Inc1).*cosd(Dec1).*cosd(Inc2).*cosd(Dec2);
yy=cosd(Inc1).*sind(Dec1).*cosd(Inc2).*sind(Dec2);
zz=sind(Inc1).*sind(Inc2);

theta=acosd(xx+yy+zz);
theta=real(theta);

end