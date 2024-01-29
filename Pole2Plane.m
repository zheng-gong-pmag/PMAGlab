function [Strike,Dip]=Pole2Plane(Dec,Inc)

id=(Inc<0);
Dec(id)=mod(Dec(id)-180,360);
Inc(id)=-Inc(id);

Strike=mod(Dec+90,360);
Dip=90-Inc;

end