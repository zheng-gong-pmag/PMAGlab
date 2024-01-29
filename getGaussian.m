function [y]=getGaussian(x,mu,sig,amp,vo)

y=amp.*exp(-(((x-mu).^2)/(2*sig.^2)))+vo;

end