function [Dec,Inc]=Plane2Pole(Strike,Dip)

Dec=mod(Strike-90,360);
Inc=90-Dip;

end