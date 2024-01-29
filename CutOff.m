function [Plat_in,Plon_in,Plat_ex,Plon_ex,A,N]=CutOff(Plat,Plon,kwargs)

arguments
    Plat;
    Plon;
    kwargs.method='Vandamme';
    kwargs.showplot {MustBeBoolean(kwargs.showplot)} = false;
end

Plat_in=Plat;
Plon_in=Plon;

Vandamme=strcmpi(kwargs.method,{'Vandamme','V'});
deg45=strcmpi(kwargs.method,{'45','deg45','45deg'});

[Plon_m,Plat_m,~,~,~,N]=FisherMean(Plon_in,Plat_in);
theta_i=AngDiff(Plon_in,Plat_in,Plon_m,Plat_m);

if sum(Vandamme)>0

    ASD=sqrt(sum(theta_i.^2)./(N-1));
    A=1.8*ASD+5;
    [theta_i_max,id_max]=max(theta_i);

    while theta_i_max >= A

        Plon_in(id_max)=[];
        Plat_in(id_max)=[];

        [Plon_m,Plat_m,~,~,~,N]=FisherMean(Plon_in,Plat_in);
        theta_i=AngDiff(Plon_in,Plat_in,Plon_m,Plat_m);
        ASD=sqrt(sum(theta_i.^2)./(N-1));
        A=1.8*ASD+5;
        [theta_i_max,id_max]=max(theta_i);

    end

end

if sum(deg45)>0

    id=(theta_i<=45);
    Plon_in=Plon_in(id);
    Plat_in=Plat_in(id);
    A=45;
    N=sum(id);

end

Plon_ex=setdiff(Plon_raw,Plon_in);
Plat_ex=setdiff(Plat_raw,Plat_in);

if kwargs.showplot
    PlotStereonet(Plon_in,Plat_in,"datacolor",'b');
    PlotStereonet(Plon_ex,Plat_ex,"datacolor",'r');
end

end
