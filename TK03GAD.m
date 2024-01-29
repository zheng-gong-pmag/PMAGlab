function [Elongation]=TK03GAD(Inc)

% Polynomial coefficients are from 
% Tauxe, L., Kodama, K. P., & Kent, D. V. (2008). Testing corrections for paleomagnetic inclination error 
% in sedimentary rocks: A comparative approach. Physics of the Earth and Planetary Interiors, 169(1-4), 152-165.

a=2.895;
b=-1.466e-2;
c=-3.525e-4;
d=3.16e-6;

Inc=abs(Inc);
Elongation=a+b*Inc+c*Inc.^2+d*Inc.^3;

end