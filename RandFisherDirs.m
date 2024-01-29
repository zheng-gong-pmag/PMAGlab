function [RandDec,RandInc]=RandFisherDirs(Dec,Inc,k,n)

d=2*asind(sqrt(-log(rand(n,1)*(1-exp(-2*k))+exp(-2*k))./(2*k)));

RandDec0=360*rand(n,1);
RandInc0=90-d;

[EulerLat,EulerLon,EulerAng]=VGP2GeoPole(Inc,Dec,'north');

[RandInc,RandDec]=EulerRot(RandInc0,RandDec0,EulerLat,EulerLon,-EulerAng);

end