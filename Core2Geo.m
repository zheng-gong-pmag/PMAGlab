function [rot_dec,rot_inc]=Core2Geo(dec,inc,azimuth,hade,kwargs)

arguments
    dec;
    inc;
    azimuth;
    hade;
    kwargs.convention='pomeroy';
end

if strcmpi(kwargs.convention,'caltech')
    % Caltech convention
    % core plate strike = pomeroy azimuth + 90°
    % core plate dip = pomeroy hade
    azimuth=mod(azimuth-90,360);
end

rad=pi/180;
n=length(dec);

rot_dec=nan(n,1);
rot_inc=nan(n,1);

if numel(azimuth)==1
    azimuth=azimuth.*ones(n,1);
end

if numel(hade)==1
    hade=hade.*ones(n,1);
end

for i=1:n

    dec_i=dec(i);
    inc_i=inc(i);
    azimuth_i=azimuth(i);
    hade_i=hade(i);

    mtx1=roty(hade_i);
    mtx2=rotz(azimuth_i);

    mtx=mtx2*mtx1;

    x=cos(rad.*inc_i).*cos(rad.*dec_i);
    y=cos(rad.*inc_i).*sin(rad.*dec_i);
    z=sin(rad.*inc_i);

    rot_xyz=mtx*[x;y;z];

    rot_inc(i,1)=asin(rot_xyz(3))./rad;
    rot_dec(i,1)=mod(atan2(rot_xyz(2),rot_xyz(1))./rad,360);

end

end
