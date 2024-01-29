function [rot_dec,rot_inc]=Geo2Strat(dec,inc,strike,dip)

n=length(dec);

rot_dec=nan(n,1);
rot_inc=nan(n,1);

if numel(strike)==1
    strike=strike.*ones(n,1);
end

if numel(dip)==1
    dip=dip.*ones(n,1);
end

for i=1:n

    dec_i=dec(i);
    inc_i=inc(i);
    strike_i=strike(i);
    dip_i=dip(i);

    mtx1=rotz(mod(-strike_i,360));
    mtx2=rotx(-dip_i);
    mtx3=rotz(mod(strike_i,360));

    mtx=mtx3*mtx2*mtx1;

    x=cosd(inc_i).*cosd(dec_i);
    y=cosd(inc_i).*sind(dec_i);
    z=sind(inc_i);

    rot_xyz=mtx*[x;y;z];

    rot_inc(i,1)=asind(rot_xyz(3));
    rot_dec(i,1)=mod(atan2d(rot_xyz(2),rot_xyz(1)),360);

end

end