function [B,Bh,Bv]=VDM2B(vdm,lat,kwargs)

arguments
    vdm;
    lat;
    kwargs.radius=6371e3;
end

lat=lat*pi/180;         % radians

B=vdm.*sqrt(1+3*sin(lat).^2)./(kwargs.radius.^3);
Bv=2*vdm.*sin(lat)./(kwargs.radius.^3);
Bh=vdm.*cos(lat)./(kwargs.radius.^3);

% convert Am2 to T
B=B*1e-7;
Bv=Bv*1e-7;
Bh=Bh*1e-7;

end