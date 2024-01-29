function [A95,R]=KN2A95R(K,N)

p=0.05;
R=N-((N-1)./K);
A95=acosd(1-((N-R)./R).*((1./p)^(1/(N-1))-1));

end