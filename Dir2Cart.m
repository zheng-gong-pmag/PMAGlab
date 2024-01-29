function [x,y,z]=Dir2Cart(Dec,Inc)

x=cosd(Inc).*cosd(Dec);
y=cosd(Inc).*sind(Dec);
z=sind(Inc);

end
