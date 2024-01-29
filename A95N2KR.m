function [K,R]=A95N2KR(a95,N)

p=0.05;
R=N./((1-cosd(a95))./((1./p).^(1./(N-1))-1)+1);
K=(N-1)./(N-R);

end