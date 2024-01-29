function [vdm]=B2VDM(B,lat,kwargs)

arguments
    B;
    lat;
    kwargs.radius=6371e3;
end

lat=lat*pi/180;         % radian
B=B*1e7;                % convert T to Am2

vdm=B.*(kwargs.radius.^3)./sqrt(1+3*sin(lat).^2);

end