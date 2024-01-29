function [a95,k]=NR2A95K(N,R)

p=0.05;
k=(N-1)./(N-R);
a95=acosd(1+(N-1).*(1-(1./p).^(1./(N-1)))/(N.*(k-1)+1));

end