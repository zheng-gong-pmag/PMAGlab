function [Dec,Inc,R]=Cart2Dir(x,y,z)

Dec=mod(atan2d(y,x),360);
Inc=atan2d(z,sqrt(x.*x+y.*y));
R=sqrt(x.*x+y.*y+z.*z);

end