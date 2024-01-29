function [DecM,IncM,A95M,KM,R,N]=FisherMean(Dec,Inc,kwargs)

arguments
    Dec;
    Inc;
    kwargs.flip {MustBeBoolean(kwargs.flip)}=false;
end

rad=pi/180;
N=length(Dec);

if kwargs.flip
[Dec,Inc,~]=FlipDir(Dec,Inc);
end

% Calculate the mean of VGPs   
x=cos(Inc.*rad).*cos(Dec.*rad);
y=cos(Inc.*rad).*sin(Dec.*rad);
z=sin(Inc.*rad);

R=sqrt(sum(x)^2+sum(y)^2+sum(z)^2);

X=sum(x)/R;
Y=sum(y)/R;
Z=sum(z)/R;

DecM=mod(atan2(Y,X)/rad,360);
IncM=asin(Z)/rad;
KM=(N-1)/(N-R);
p=0.05;
A95M=acos(1-((N-R)./R).*((1/p)^(1/(N-1))-1))./rad;

end
    