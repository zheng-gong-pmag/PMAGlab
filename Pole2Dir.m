function [Dec,Inc,a95]=Pole2Dir(Slat,Slon,Plat,Plon,A95)

rad=pi/180;
n=max(length(Plat),length(Slat));
cbz_lon=nan(n,1);
Dec=nan(n,1);

cbz_lat=abs(Slat)-90;

for i=1:length(Slat)
    if Slat(i)>0
        cbz_lon(i)=Slon(i);
    else
        cbz_lon(i)=mod(Slon(i)+180,360);
    end
end


paleolat=90-acos(sin(Slat*rad).*sin(Plat*rad)+cos(Slat*rad).*cos(Plat*rad).*cos((Plon-Slon)*rad))/rad;          % paleo-latitude

dist=acos(sin(Plat*rad).*sin(cbz_lat*rad)+cos(Plat*rad).*cos(cbz_lat*rad).*cos((cbz_lon'-Plon)*rad))/rad;

firstcalcn=mod(asin(sin((Plon-Slon)*rad).*cos(Plat*rad)./cos(paleolat*rad))/rad,360);

for i=1:n

    if dist(i)>90
        Dec(i,1)=firstcalcn(i);
    else
        Dec(i,1)=180-firstcalcn(i);
    end

end

Dec=mod(Dec,360);
Inc=atan(2*tan(paleolat.*rad))/rad;

% calculate a95 from A95
p=atan(tan(Inc*rad)*0.5);

x=((1+3*sin(p).*sin(p))/2);
y=cos(p)./cos(Inc*rad);

a95=A95./sqrt(x.*y);

end